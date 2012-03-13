//
//  DOUOAuthRequest.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUOAuth2Provider.h"
#import "DOUOAuth2.h"
#import "SBJson.h"


@implementation DOUOAuth2Provider


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


- (ASIFormDataRequest *)auth2Request:(DOUOAuth2Consumer *)consumer {
  
  ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:tokenURL_]];
  [req setAllowCompressedResponse:YES]; // YES is the default
  [req setTimeOutSeconds:kDefaultTimeoutSeconds];
  [req setRequestMethod:@"POST"];
  [req setPostValue:consumer.key forKey:kClientIdKey];
  [req setPostValue:consumer.secret forKey:kClientSecretKey];
  [req setPostValue:kGrantTypePassword forKey:kGrantTypeKey];
  [req setStringEncoding:NSUTF8StringEncoding];  
  return  req;
}


#pragma mark - Auth2 actions

- (void)accessTokenByPassword:(DOUOAuth2Consumer *)consumer 
                     username:(NSString *)username 
                     password:(NSString *)password 
                     delegate:(id<DOULoginDelegate>)delegate {
  ASIFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:username forKey:kUsernameKey];
  [req setPostValue:password forKey:kPasswordKey];
  [req setDelegate:self];
  
  NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:consumer, kConsumerKey, delegate, kDelegateKey, nil];
  
  [req setUserInfo:dic];
  [req startAsynchronous];
}


- (void)requestFailed:(ASIHTTPRequest *)request {
  NSInteger errorCode = kOAuthErrorUnknown;
  
  NSString *responseStr = [request responseString];
  NSLog(@"login failed response: %@", responseStr);

  if (responseStr) {
    NSDictionary *dic = [responseStr JSONValue];
    errorCode = [[dic objectForKey:@"code"] integerValue];    
  }
  
  id delegate = [[request userInfo] objectForKey:kDelegateKey];
  if ([delegate respondsToSelector:@selector(loginFailed:)]){
    [delegate loginFailed:errorCode];
  }
}


- (void)requestFinished:(ASIHTTPRequest *)request {
  NSError *error = [request error];
  if (!error) {
    
    int code = [request responseStatusCode];
    if (code == 201 || code == 200) {
      // success
      DOUOAuth2Consumer *consumer = (DOUOAuth2Consumer *)[[request userInfo] objectForKey:kConsumerKey];    
      NSString* responseStr = [request responseString];
      NSLog(@"login success response: %@", responseStr);
      [consumer updateWithHTTPResponse:responseStr];
      [consumer save];
      
      id delegate = [[request userInfo] objectForKey:kDelegateKey];
      if ([delegate respondsToSelector:@selector(loginFinished)]){
        [delegate loginFinished];
      }
      return ;
    }
    
    [self requestFailed:request];
  }
  
}

 
- (NSError *)accessTokenByRefresh:(DOUOAuth2Consumer *)consumer {
  
  ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:tokenURL_]];

  [req setRequestMethod:@"POST"];
  [req setPostValue:consumer.key forKey:kClientIdKey];
  [req setPostValue:consumer.secret forKey:kClientSecretKey];
  [req setPostValue:kGrantTypeRefreshToken forKey:kGrantTypeKey];
  [req setPostValue:consumer.refreshToken forKey:kRefreshTokenKey];
  [req setStringEncoding:NSUTF8StringEncoding];
  [req startSynchronous];
  
  NSError *error = [req error];
  if (!error) {
    NSString* responseStr = [req responseString];
    NSLog(@"response: %@", responseStr);
    [consumer updateWithHTTPResponse:responseStr];
    [consumer save];
  }
  
  return error;
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
}
*/


@end
