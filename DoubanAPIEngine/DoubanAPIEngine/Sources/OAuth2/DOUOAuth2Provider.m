//
//  DOUOAuthRequest.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUOAuth2Provider.h"
#import "DOUOAuth2.h"
#import "DOUFormDataRequest.h"

@interface DOUOAuth2Provider ()
@end

@implementation DOUOAuth2Provider

static NSUInteger kErrorCodeAccessTokenHasExpired = 106;

static NSString *kConsumerKey = @"ConsumerKey";
static NSString *kDelegateKey = @"DelegateKey";

- (id)initWithAuthURL:(NSString *)anAuthURL tokenURL:(NSString *)aTokenURL {
  self = [super init];
  if (self) {
    authURL_ = [anAuthURL retain];
    tokenURL_ = [aTokenURL retain];    
  }
  return self;
}


- (void)dealloc {
  [authURL_ release]; authURL_ = nil;
  [tokenURL_ release]; tokenURL_ = nil;
	[super dealloc];
}


- (void)accessTokenWithConsumer:(DOUOAuth2Consumer *)consumer andRequest:(DOUFormDataRequest *)request {
  
  NSLog(@"auth %@", [request url]);
  [request startSynchronous];
   
  NSError *error = [request error];
  if (!error) {
    if ([request responseStatusCode] == kErrorCodeAccessTokenHasExpired) {
      [self accessTokenByRefresh:consumer];
    }
    
    NSString* responseStr = [request responseString];
    NSLog(@"response: %@", responseStr);
    [consumer updateWithHTTPResponse:responseStr];
    [consumer save];
  }
}


- (DOUFormDataRequest *)auth2Request:(DOUOAuth2Consumer *)consumer {
  DOUFormDataRequest *req = [DOUFormDataRequest formRequestWithURL:[NSURL URLWithString:tokenURL_]];
  [req setRequestMethod:@"POST"];
  [req setPostValue:consumer.key forKey:kClientIdKey];
  [req setPostValue:consumer.secret forKey:kClientSecretKey];
  [req setPostValue:kGrantTypePassword forKey:kGrantTypeKey];
  [req setStringEncoding:NSUTF8StringEncoding];  
  return  req;
}

- (NSError *)accessTokenByPassword:(DOUOAuth2Consumer *)consumer 
                     username:(NSString *)username 
                     password:(NSString *)password {
  DOUFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:username forKey:kUsernameKey];
  [req setPostValue:password forKey:kPasswordKey];
  [self accessTokenWithConsumer:consumer andRequest:req];
  NSError *error = [req error];
  return error;
} 

- (void)asyncAccessTokenByPassword:(DOUOAuth2Consumer *)consumer 
                          username:(NSString *)username 
                          password:(NSString *)password 
                          delegate:(id<DOULoginDelegate>)delegate {
  DOUFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:username forKey:kUsernameKey];
  [req setPostValue:password forKey:kPasswordKey];
  [req setDelegate:self];
  
  NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:consumer, kConsumerKey, delegate, kDelegateKey, nil];
  
  [req setUserInfo:dic];
  [req startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
  NSError *error = [request error];
  if (!error) {
    
    DOUOAuth2Consumer *consumer = (DOUOAuth2Consumer *)[[request userInfo] objectForKey:kConsumerKey];
    if ([request responseStatusCode] == kErrorCodeAccessTokenHasExpired) {
      [self accessTokenByRefresh:consumer];
    }
    
    NSString* responseStr = [request responseString];
    NSLog(@"response: %@", responseStr);
    [consumer updateWithHTTPResponse:responseStr];
    [consumer save];
    
    id delegate = [[request userInfo] objectForKey:kDelegateKey];
    if ([delegate respondsToSelector:@selector(loginFinished)]){
      [delegate loginFinished];
    }
  }
  
}

- (void)requestFailed:(ASIHTTPRequest *)request {
  NSError *error = [request error];
  NSLog(@"error: %@", error);
  id delegate = [[request userInfo] objectForKey:kDelegateKey];
  if ([delegate respondsToSelector:@selector(loginFinished)]){
    [delegate loginFailed];
  }
}


 
- (void)accessTokenByRefresh:(DOUOAuth2Consumer *)consumer {
  DOUFormDataRequest *req = [DOUFormDataRequest requestWithURL:[NSURL URLWithString:tokenURL_]];
  [req setRequestMethod:@"POST"];
  [req setPostValue:consumer.key forKey:kClientIdKey];
  [req setPostValue:consumer.secret forKey:kClientSecretKey];
  [req setPostValue:kGrantTypeRefreshToken forKey:kGrantTypeKey];  
  [req setPostValue:consumer.refreshToken forKey:kRefreshTokenKey];
  
  [req setStringEncoding:NSUTF8StringEncoding];
  [self accessTokenWithConsumer:consumer andRequest:req];
}

/*
- (void)accessTokenByAuthorizationCode:(DOUOAuth2Consumer *)consumer 
                     authorizationCode:(NSString *)authorizationCode {
  DOUHttpRequest *req = [DOUHttpRequest requestWithURL:[NSURL URLWithString:tokenURL_]];
  [req setRequestMethod:@"POST"];
  [req setPostValue:consumer.key forKey:kClientIdKey];
  [req setPostValue:consumer.secret forKey:kClientSecretKey];
  [req setPostValue:consumer.redirectURL forKey:kRedirectURIKey];
  
  [req setPostValue:kGrantTypeAuthorizationCode forKey:kGrantTypeKey];  
  [req setPostValue:authorizationCode forKey:kOAuth2ResponseTypeCode];
  
  [req setStringEncoding:NSUTF8StringEncoding];
  [self accessTokenWithConsumer:consumer andRequest:req];
}
*/



@end
