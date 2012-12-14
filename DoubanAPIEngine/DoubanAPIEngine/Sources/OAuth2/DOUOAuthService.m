//
//  DOUOAuthRequest.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUOAuthService.h"
#import "DOUOAuth2.h"
#import "DOUOAUthStore.h"
#import "SBJson.h"
#import "ASIFormDataRequest.h"


@interface DOUOAuthService () <ASIHTTPRequestDelegate>
@end


@implementation DOUOAuthService

@synthesize delegate = delegate_;

@synthesize clientId = clientId_;
@synthesize clientSecret = clientSecret_;
@synthesize authorizationURL = authorizationURL_;
@synthesize callbackURL = callbackURL_;
@synthesize authorizationCode = authorizationCode_;


static DOUOAuthService *myInstance = nil;

+ (DOUOAuthService *)sharedInstance {
  
  @synchronized(self) {
    if (myInstance == nil) {
      myInstance = [[DOUOAuthService alloc] init];
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


- (void)dealloc {
  [clientId_ release];
  [clientSecret_ release];
  [authorizationCode_ release];
  [callbackURL_ release];
  [authorizationURL_ release];
  [super dealloc];
}





#pragma mark - Auth2 actions

- (ASIFormDataRequest *)formRequest {
  NSURL *URL = [NSURL URLWithString:authorizationURL_];
  ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:URL];
  [req setRequestMethod:@"POST"];
  [req setValidatesSecureCertificate:NO];
  [req setAllowCompressedResponse:YES]; // YES is the default
  [req setTimeOutSeconds:kDefaultTimeoutSeconds];
  
  [req setPostValue:self.clientId forKey:kClientIdKey];
  [req setPostValue:self.clientSecret forKey:kClientSecretKey];
  [req setPostValue:self.callbackURL forKey:kRedirectURIKey];
  
  return req;
}


- (void)validateAuthorizationCode {
  ASIFormDataRequest *req = [self formRequest];
  [req setDelegate:self];
  [req setPostValue:@"authorization_code" forKey:kGrantTypeKey]; 
  [req setPostValue:self.authorizationCode forKey:kOAuth2ResponseTypeCode];
  [req startAsynchronous];
}


- (void)validateUsername:(NSString *)username password:(NSString *)password {  
  ASIFormDataRequest *req = [self formRequest];
  [req setDelegate:self];

  [req setPostValue:kGrantTypePassword forKey:kGrantTypeKey];  
  [req setPostValue:username forKey:kUsernameKey];
  [req setPostValue:password forKey:kPasswordKey];

  [req startAsynchronous];
}


- (NSError *)validateRefresh {
  ASIFormDataRequest *req = [self formRequest];
  [req setPostValue:kGrantTypeRefreshToken forKey:kGrantTypeKey];
  
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  NSString *refreshToken = store.refreshToken;
  [req setPostValue:refreshToken forKey:kOAuth2ResponseTypeToken];
  [req startSynchronous];
  
  NSError *error = [req error];
  if (!error) {
    NSString* responseStr = [req responseString];
    NSDictionary *dic = [responseStr JSONValue];
    DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
    [store updateWithSuccessDictionary:dic];
  }
  
  return error;
}


- (void)requestFailed:(ASIHTTPRequest *)req {
  NSError *error = nil;
  
  NSError *asiError = [req error];
  // handle the http error
  if (asiError) {
     error = [DOUHttpRequest adapterError:asiError];
  }

  // handle the oauth error
  int statusCode = [req responseStatusCode];
  if (statusCode >= 400 && statusCode <= 403) {
    NSString *response = [req responseString];
    NSDictionary *dic = [response JSONValue];  
    if (dic) {
      NSInteger code = [[dic objectForKey:@"code"] integerValue];
      error = [NSError errorWithDomain:DOUOAuthErrorDomain
                                  code:code 
                              userInfo:dic];
    }
  }

  if ([delegate_ respondsToSelector:@selector(OAuthClient:didFailWithError:)]) {
    [delegate_ OAuthClient:self didFailWithError:error];
  }
 
}


- (void)requestFinished:(ASIHTTPRequest *)req {
  NSError *error = nil;

  NSError *asiError = [req error];
  if (asiError) {
    error = [DOUHttpRequest adapterError:asiError];
  }
  
  // handle the oauth error
  int statusCode = [req responseStatusCode];
  if (statusCode >= 400 && statusCode <= 403) {
    NSString *response = [req responseString];
    NSDictionary *dic = [response JSONValue];  
    if (dic) {
      NSInteger code = [[dic objectForKey:@"code"] integerValue];
      error = [NSError errorWithDomain:DOUOAuthErrorDomain
                                  code:code 
                              userInfo:dic];
    }
  }
  
  // Error
  if (error) {
    if ([delegate_ respondsToSelector:@selector(OAuthClient:didFailWithError:)]) {
      [delegate_ OAuthClient:self didFailWithError:error];
      return ;
    }
  }
  
  // Success
  NSString *response = [req responseString];
  NSLog(@"login success:%@", response);
  NSDictionary *dic = [response JSONValue];
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  [store updateWithSuccessDictionary:dic];
  
  if ([delegate_ respondsToSelector:@selector(OAuthClient:didAcquireSuccessDictionary:)]) {
    [delegate_ OAuthClient:self didAcquireSuccessDictionary:dic];
  }
}
 



#if NS_BLOCKS_AVAILABLE

- (void)validateUsername:(NSString *)username
                password:(NSString *)password 
                callback:(DOUBasicBlock)block {
  ASIFormDataRequest *req = [self formRequest];
  
  [req setDelegate:self];

  [req setPostValue:@"password" forKey:kGrantTypeKey];  
  [req setPostValue:username forKey:kUsernameKey];
  [req setPostValue:password forKey:kPasswordKey];
  [req setCompletionBlock:block];
  [req setFailedBlock:block];
  
  [req startAsynchronous];
}


- (void)validateAuthorizationCodeWithCallback:(DOUBasicBlock)block {
  ASIFormDataRequest *req = [self formRequest];
  [req setDelegate:self];
  [req setPostValue:@"authorization_code" forKey:kGrantTypeKey]; 
  [req setPostValue:self.authorizationCode forKey:kOAuth2ResponseTypeCode];

  [req setCompletionBlock:block];
  [req setFailedBlock:block];
  
  [req startAsynchronous];
}


#endif



- (void)logout {
  DOUOAuthStore *store = [DOUOAuthStore sharedInstance];
  [store clear];
}

@end
