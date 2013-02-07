//
//  DOUService.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUService.h"
#import "DOUHTTPRequest.h"
#import "DOUAPIConfig.h"
#import "GDataEntryBase.h"
#import "DOUOAuthService.h"
#import "DOUOAuthStore.h"
#import "DOUQuery.h"
#import "DoubanDefines.h"
#import "NSData+Base64.h"

#import "ASINetworkQueue.h"


@interface DOUService ()

@property (nonatomic, retain) ASINetworkQueue   *queue;

- (void)addRequest:(DOUHttpRequest *)request;
- (void)setMaxConcurrentOperationCount:(NSUInteger)maxConcurrentOperationCount;

@end

@implementation DOUService

NSUInteger const kDefaultMaxConcurrentOperationCount = 4;

@synthesize queue = queue_;

@synthesize apiBaseUrlString = apiBaseUrlString_;
@synthesize clientId = clientId_;
@synthesize clientSecret = clientSecret_;


- (id)init {
  self = [super init];
  if (self) {
    
  }
  return self;
}


- (void)dealloc {
  [queue_ release]; queue_ = nil;
  [apiBaseUrlString_ release]; apiBaseUrlString_ = nil;
  [clientId_ release]; clientId_ = nil;
  [clientSecret_ release]; clientSecret_ = nil;
  [super dealloc];
}


#pragma mark - Singleton

static DOUService *myInstance = nil;

+ (DOUService *)sharedInstance {
  
  @synchronized(self) {
    if (myInstance == nil) {
      myInstance = [[DOUService alloc] init];
    }
    
  }
  return myInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
  @synchronized(self) {
    if (myInstance == nil) {
      myInstance = [super allocWithZone:zone];
      return myInstance;  // assignment and return on first allocation
    }
  }
  return nil; 
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}


- (id)retain {
  return self;
}


- (unsigned)retainCount {
  return UINT_MAX;
}


- (oneway void)release {
  //nothing
}


- (id)autorelease {
  return self;
}



- (NSError *)executeRefreshToken {
  DOUOAuthService *service = [DOUOAuthService sharedInstance];
  service.authorizationURL = kTokenUrl;
  service.clientId = self.clientId;
  service.clientSecret = self.clientSecret;
  return [service validateRefresh];
}



- (NSDictionary *)parseQueryString:(NSString *)query {
  NSMutableDictionary *dict = [[[NSMutableDictionary alloc] initWithCapacity:6] autorelease];
  NSArray *pairs = [query componentsSeparatedByString:@"&"];
  
  for (NSString *pair in pairs) {
    NSArray *elements = [pair componentsSeparatedByString:@"="];
    NSString *key = 
    [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *val = 
    [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [dict setObject:val forKey:key];
  }
  return dict;
}


- (void)sign:(DOUHttpRequest *)request {
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  if (store.accessToken && ![store hasExpired]) {
    NSString *authValue = [NSString stringWithFormat:@"%@ %@", @"Bearer", store.accessToken];
    //NSLog(@"bearer:%@", authValue);
    [request addRequestHeader:@"Authorization" value:authValue];      
  }
  else {
    NSString *clientId = self.clientId;
    if (!clientId) {
      return ;
    }
    
    NSURL *url = [request url];
    NSString *urlString = [url absoluteString];
    NSString *query = [url query];
    if (query) {
      NSDictionary *parameters = [self parseQueryString:query];
      
      NSArray *keys = [parameters allKeys];      
      if ([keys count]  == 0) {
        urlString = [urlString stringByAppendingFormat:@"?%@=%@", @"apikey", clientId];
      }
      else {
        urlString = [urlString stringByAppendingFormat:@"&%@=%@", @"apikey", clientId];
      }
    }
    else {
      urlString = [urlString stringByAppendingFormat:@"?%@=%@", @"apikey", clientId];  
    }
    
    NSString *afterUrl = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    request.url = [NSURL URLWithString:afterUrl];
  }
  
}


- (void)addRequest:(DOUHttpRequest *)request {
  
  if (![self queue]) {
    [self setQueue:[[[ASINetworkQueue alloc] init] autorelease]];
    self.queue.maxConcurrentOperationCount = kDefaultMaxConcurrentOperationCount;
  }
  
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  if (store.userId != 0 && store.refreshToken && [store shouldRefreshToken]) {
    [self executeRefreshToken];
  }
  
  [self sign:request];

  [[self queue] addOperation:request];
  [[self queue] go];
}


- (void)setMaxConcurrentOperationCount:(NSUInteger)maxCount {
  self.queue.maxConcurrentOperationCount = maxCount;
}


- (BOOL)isValid {
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  if (store.accessToken) {
    return ![store hasExpired];
  }
  return NO;
}


#if NS_BLOCKS_AVAILABLE

- (DOUHttpRequest *)get:(DOUQuery *)query callback:(DOUReqBlock)block {
  query.apiBaseUrlString = self.apiBaseUrlString;
  // __block, It tells the block not to retain the request, which is important in preventing a retain-cycle,
  // since the request will always retain the block
  __block DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query completionBlock:^{
    if (block != NULL) {
      block(req);      
    }
  }];
  
  [req setRequestMethod:@"GET"];

  [self addRequest:req];
  return req;
}


- (DOUHttpRequest *)post:(DOUQuery *)query postBody:(NSString *)body callback:(DOUReqBlock)block {
  query.apiBaseUrlString = self.apiBaseUrlString;
  __block DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query completionBlock:^{
    if (block != NULL) {
      block(req);      
    }
  }];
  
  [req setRequestMethod:@"POST"];
  [req addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded; charset=UTF-8"];      

  if (body && [body length] > 0) {
    
    NSError *error = nil;
    GDataXMLElement *element = [[[GDataXMLElement alloc] initWithXMLString:body error:&error] autorelease];
    if (!error && element) {
      // if body is XML, Content-Type must be application/atom+xml
      [req addRequestHeader:@"Content-Type" value:@"application/atom+xml"];
    }
    
    NSData *objectData = [body dataUsingEncoding:NSUTF8StringEncoding];
    NSString *length = [NSString stringWithFormat:@"%d", [objectData length]];
    [req appendPostData:objectData];
    [req addRequestHeader:@"Content-Length" value:length];        
  }
  else {
    [req addRequestHeader:@"Content-Length" value:@"0"];
  }
  
  [req setResponseEncoding:NSUTF8StringEncoding];
  [self addRequest:req];
  return req;
}


- (DOUHttpRequest *)post2:(DOUQuery *)query 
                photoData:(NSData *)photoData
              description:(NSString *)description
                 callback:(DOUReqBlock)block 
   uploadProgressDelegate:(id<ASIProgressDelegate>)progressDelegate {
  
  query.apiBaseUrlString = self.apiBaseUrlString;
  __block DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query completionBlock:^{
    if (block != NULL) {
      block(req);      
    }
  }];
  

  NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
	
	// We don't bother to check if post data contains the boundary, since it's pretty unlikely that it does.
	CFUUIDRef uuid = CFUUIDCreate(nil);
	NSString *uuidString = [(NSString*)CFUUIDCreateString(nil, uuid) autorelease];
	CFRelease(uuid);
	NSString *stringBoundary = [NSString stringWithFormat:@"0xKhTmLbOuNdArY-%@",uuidString];
  NSString *endItemBoundary = [NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary];

  [req setRequestMethod:@"POST"];
  [req setResponseEncoding:NSUTF8StringEncoding];
  [req setUploadProgressDelegate:progressDelegate];
  
	[req addRequestHeader:@"Content-Type" value:[NSString stringWithFormat:@"multipart/form-data; charset=%@; boundary=%@", charset, stringBoundary]];
	
	[req appendPostString:[NSString stringWithFormat:@"--%@\r\n",stringBoundary]];
	
	// Adds post data
  [req appendPostString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"desc"]];
  [req appendPostString:description];
  [req appendPostString:endItemBoundary];

  // Adds Post file  
  [req appendPostString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", @"image", @"image.jpeg"]];
  [req appendPostString:[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", @"image/jpeg"]];
  [req appendPostData:photoData];
  
	[req appendPostString:[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary]];
  
  // request length
  NSData *postData = [req postBody];
  [req addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%d", [postData length]]];  
  
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  if (store.userId != 0 && store.refreshToken && [store shouldRefreshToken]) {
    [self executeRefreshToken];
  }
  
  [self sign:req];
  [req startAsynchronous];
  return req;
}


- (DOUHttpRequest *)post:(DOUQuery *)query 
               photoData:(NSData *)photoData
             description:(NSString *)description
                callback:(DOUReqBlock)block 
  uploadProgressDelegate:(id<ASIProgressDelegate>)progressDelegate {
  
  query.apiBaseUrlString = self.apiBaseUrlString;
  __block DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query completionBlock:^{
    if (block != NULL) {
      block(req);      
    }
  }];
  
  
  NSString *boundary = [[NSProcessInfo processInfo] globallyUniqueString];
  NSData *boundaryData   = [[NSString stringWithFormat:@"--%@\n", boundary] 
                                     dataUsingEncoding:NSUTF8StringEncoding];

  NSData *finalBoundaryData = [[NSString stringWithFormat:@"\n--%@--", boundary]
                                        dataUsingEncoding:NSUTF8StringEncoding]; 

  [req setRequestMethod:@"POST"];
  [req setResponseEncoding:NSUTF8StringEncoding];
  [req setUploadProgressDelegate:progressDelegate];

  [req addRequestHeader:@"Content-Type" 
                  value:[NSString stringWithFormat:@"multipart/related; boundary=\"%@\"", boundary]];
  [req addRequestHeader:@"MIME-version" value:@"1.0"];
  
  // Content XML
  [req appendPostData:boundaryData];
  [req appendPostData:[@"Content-Type: application/atom+xml\n\n" dataUsingEncoding:NSUTF8StringEncoding]];
  
  GDataEntryBase *emptyEntry = [[[GDataEntryBase alloc] init] autorelease];
  NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:kAtomNamespace, kAtomNamespacePrefix, kDoubanNamespace, kDoubanNamespacePrefix, nil];
  [emptyEntry addNamespaces:dic];
  [emptyEntry addExtensionDeclarations];
  
  GDataEntryContent *content = [GDataEntryContent contentWithString:description];
  [emptyEntry setContent:content];
  NSData *descData = [[emptyEntry XMLDocument] XMLData];
  [req appendPostData:descData];
  [req appendPostData:boundaryData];
  
  // Image base64 binary
  [req appendPostData:[@"Content-Type: image/jpeg\n\n" dataUsingEncoding:NSUTF8StringEncoding]];
  
  NSString *encodingStr = [photoData base64EncodedString];
  NSData *data = [encodingStr dataUsingEncoding:NSUTF8StringEncoding];
  [req appendPostData:data];
  [req appendPostData:finalBoundaryData];

  // request length
  NSData *postData = [req postBody];
  [req addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%d", [postData length]]];  
  
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  if (store.userId != 0 && store.refreshToken && [store shouldRefreshToken]) {
    [self executeRefreshToken];
  }
  
  [self sign:req];
  //NSLog(@"request url:%@", [req.url absoluteString]);
  [req startAsynchronous];
  return req;  
}


- (DOUHttpRequest *)put:(DOUQuery *)query postBody:(NSString *)body callback:(DOUReqBlock)block {
  query.apiBaseUrlString = self.apiBaseUrlString;
  __block DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query completionBlock:^{
    if (block != NULL) {
      block(req);
    }
  }];
  
  [req setRequestMethod:@"PUT"];
  [req addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded; charset=UTF-8"];
  
  if (body && [body length] > 0) {
    
    NSError *error = nil;
    GDataXMLElement *element = [[[GDataXMLElement alloc] initWithXMLString:body error:&error] autorelease];
    if (!error && element) {
      // if body is XML, Content-Type must be application/atom+xml
      [req addRequestHeader:@"Content-Type" value:@"application/atom+xml"];
    }
    
    NSData *objectData = [body dataUsingEncoding:NSUTF8StringEncoding];
    NSString *length = [NSString stringWithFormat:@"%d", [objectData length]];
    [req appendPostData:objectData];
    [req addRequestHeader:@"Content-Length" value:length];
  }
  else {
    [req addRequestHeader:@"Content-Length" value:@"0"];
  }
  
  [req setResponseEncoding:NSUTF8StringEncoding];
  [self addRequest:req];
  return req;
}


- (DOUHttpRequest *)delete:(DOUQuery *)query callback:(DOUReqBlock)block {
  
  query.apiBaseUrlString = self.apiBaseUrlString;

  __block DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query completionBlock:^{
    if (block != NULL) {
      block(req);      
    }
  }];
  
  [req setRequestMethod:@"DELETE"];
  [req addRequestHeader:@"Content-Type" value:@"application/atom+xml"];
  [req addRequestHeader:@"Content-Length" value:@"0"];
  [self addRequest:req];
  return req;
}


#endif


- (DOUHttpRequest *)get:(DOUQuery *)query delegate:(id<DOUHttpRequestDelegate>)delegate {
  query.apiBaseUrlString = self.apiBaseUrlString;
  DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query target:delegate];
  
  [req setRequestMethod:@"GET"];
  [self addRequest:req];
  return req;
}


- (DOUHttpRequest *)post:(DOUQuery *)query postBody:(NSString *)body delegate:(id<DOUHttpRequestDelegate>)delegate {
  query.apiBaseUrlString = self.apiBaseUrlString;
  DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query target:delegate];
  
  [req setRequestMethod:@"POST"];
  [req addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded; charset=UTF-8"];
  
  if (body && [body length] > 0) {
    
    NSError *error = nil;
    GDataXMLElement *element = [[[GDataXMLElement alloc] initWithXMLString:body error:&error] autorelease];
    if (!error && element) {
      // if body is XML, Content-Type must be application/atom+xml
      [req addRequestHeader:@"Content-Type" value:@"application/atom+xml"];
    }
    
    NSData *objectData = [body dataUsingEncoding:NSUTF8StringEncoding];
    NSString *length = [NSString stringWithFormat:@"%d", [objectData length]];
    [req appendPostData:objectData];
    [req addRequestHeader:@"Content-Length" value:length];        
  }
  else {
    [req addRequestHeader:@"Content-Length" value:@"0"];
  }
  
  [req setResponseEncoding:NSUTF8StringEncoding];
  [self addRequest:req];
  return req;
}


- (DOUHttpRequest *)delete:(DOUQuery *)query delegate:(id<DOUHttpRequestDelegate>)delegate {
  query.apiBaseUrlString = self.apiBaseUrlString;

  DOUHttpRequest * req = [DOUHttpRequest requestWithQuery:query target:delegate];
  [req setRequestMethod:@"DELETE"];
  [req addRequestHeader:@"Content-Type" value:@"application/atom+xml"];
  [req addRequestHeader:@"Content-Length" value:@"0"];      
  [self addRequest:req];
  return req;
}


@end
