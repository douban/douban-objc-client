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
#import "DOUOAuth2.h"
#import "DOUOAuth2Provider.h"
#import "DOUOAuth2Consumer.h"

#import "ASINetworkQueue.h"


@interface DOUService ()

- (void)addRequest:(DOUHttpRequest *)request;

@end

@implementation DOUService

NSUInteger const kDefaultMaxConcurrentOperationCount = 8;

@synthesize queue = queue_;
@synthesize consumer = consumer_;
@synthesize userId = userId;


- (id)init {
  self = [super init];
  if (self) {
    DOUOAuth2Consumer *consumer = [[DOUOAuth2Consumer alloc] init];
    consumer_ = [consumer retain];
    [consumer_ updateWithUserDefaults];
    [consumer release];
  }
  return self;
}


- (void)dealloc {
  [queue_ release]; queue_ = nil;
  [consumer_ release]; consumer_ = nil;
  [super dealloc];
}


#pragma mark -
#pragma mark Singleton


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

/*
- (void)release {
  //nothing
}
*/
 
- (id)autorelease {
  return self;
}

#pragma mark - Auth2 Parameters

static NSString *APIKey;
static NSString *privateKey;
static NSString *redirectUrl;

+ (void)setAPIKey:(NSString *)theAPIKey {
  APIKey = theAPIKey;
}

+ (void)setPrivateKey:(NSString *)thePrivateKey {
  privateKey = thePrivateKey;
}

+ (void)setRedirectUrl:(NSString *)theRedirectUrl {
  redirectUrl = theRedirectUrl;
}


#pragma mark - login

- (int)userId {
  if (!consumer_) {
    return consumer_.userId;
  }
  return -1;
}


- (NSError *)loginWithUsername:(NSString *)username password:(NSString *)password {

  DOUOAuth2Provider *provider = [[DOUOAuth2Provider alloc] initWithAuthURL:kAuthUrl 
                                                                  tokenURL:kTokenUrl];
  DOUOAuth2Consumer *consumer = [[[DOUOAuth2Consumer alloc] initWithKey:APIKey
                                                                secret:privateKey
                                                        andRedirectURL:redirectUrl] autorelease];
  self.consumer = consumer;
  return [provider accessTokenByPassword:self.consumer username:username password:password];
}


- (void)asyncLoginWithUsername:(NSString *)username 
                      password:(NSString *)password 
                      delegate:(id<DOULoginDelegate>)delegate {

  DOUOAuth2Provider *provider = [[DOUOAuth2Provider alloc] initWithAuthURL:kAuthUrl 
                                                                  tokenURL:kTokenUrl];
  DOUOAuth2Consumer *consumer = [[[DOUOAuth2Consumer alloc] initWithKey:APIKey
                                                                 secret:privateKey
                                                         andRedirectURL:redirectUrl] autorelease];
  self.consumer = consumer;
  [provider asyncAccessTokenByPassword:self.consumer 
                              username:username 
                              password:password
                              delegate:delegate];
}



- (void)addRequest:(DOUHttpRequest *)request {
  
  if (![self queue]) {
    [self setQueue:[[[ASINetworkQueue alloc] init] autorelease]];
     self.queue.maxConcurrentOperationCount = kDefaultMaxConcurrentOperationCount;
  }
  
  [consumer_ sign:request];
  [[self queue] addOperation:request];
  [[self queue] go];
}


- (void)setMaxConcurrentOperationCount:(NSUInteger)maxCount {
  self.queue.maxConcurrentOperationCount = maxCount;
}


@end
