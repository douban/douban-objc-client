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
  [req setRequestMethod:@"POST"];

  [req setAllowCompressedResponse:YES]; // YES is the default
  [req setTimeOutSeconds:kDefaultTimeoutSeconds];
    
  [req setPostValue:consumer.key forKey:kClientIdKey];
  [req setPostValue:consumer.secret forKey:kClientSecretKey];
  [req setPostValue:consumer.redirectURL forKey:kRedirectURIKey];

  [req setStringEncoding:NSUTF8StringEncoding];  
  return  req;
}


#pragma mark - Auth2 actions

- (void)accessTokenByPassword:(NSString *)password 
                     username:(NSString *)username 
                     consumer:(DOUOAuth2Consumer *)consumer
                     delegate:(id<DOUHttpRequestDelegate>)delegate {
  ASIFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:kGrantTypePassword forKey:kGrantTypeKey];
  [req setPostValue:username forKey:kUsernameKey];
  [req setPostValue:password forKey:kPasswordKey]; 
  [req setDelegate:self];
  
  NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:consumer, kConsumerKey, delegate, kDelegateKey, nil];
  [req setUserInfo:dic];
  [req startAsynchronous];
}


- (void)accessTokenByAuthorizationCode:(NSString *)authorizationCode
                              consumer:(DOUOAuth2Consumer *)consumer
                              delegate:(id<DOUHttpRequestDelegate>)delegate {
  ASIFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:kGrantTypeAuthorizationCode forKey:kGrantTypeKey];  
  [req setPostValue:authorizationCode forKey:kOAuth2ResponseTypeCode];;
  [req setDelegate:self];
  
  NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:consumer, kConsumerKey, delegate, kDelegateKey, nil];
  [req setUserInfo:dic];
  [req startAsynchronous];  
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
  if (statusCode == 400) {
    NSString *response = [req responseString];
    NSDictionary *dic = [response JSONValue];  
    if (dic) {
      NSInteger code = [[dic objectForKey:@"code"] integerValue];
      error = [NSError errorWithDomain:DOUOAuthErrorDomain
                                  code:code 
                              userInfo:dic];
    }
  }

  // handled by delegate
  id delegate = [[req userInfo] objectForKey:kDelegateKey];
  if ([delegate respondsToSelector:@selector(requestFailed:)]) {
    [req setError:error];
    [delegate requestFailed:req];
  }   
}


- (void)requestFinished:(ASIHTTPRequest *)req {
  
  NSLog(@"login response: %@", [req responseString]);
  NSError *error = [req error];
  if (!error) {
    
    int code = [req responseStatusCode];
    if (code == 201 || code == 200) {
      // success
      DOUOAuth2Consumer *consumer = (DOUOAuth2Consumer *)[[req userInfo] objectForKey:kConsumerKey];    
      NSString* responseStr = [req responseString];
      [consumer updateWithHTTPResponse:responseStr];
      [consumer save];
      
      // handled by delegate
      id delegate = [[req userInfo] objectForKey:kDelegateKey];
      if ([delegate respondsToSelector:@selector(requestFinished:)]){
        [delegate requestFinished:req];
      }
      return ;
    }
  }
  
  [self requestFailed:req];  
}

 
- (NSError *)accessTokenByRefresh:(DOUOAuth2Consumer *)consumer {
  
  ASIFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:kGrantTypeRefreshToken forKey:kGrantTypeKey];
  [req setPostValue:consumer.refreshToken forKey:kOAuth2ResponseTypeToken];
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



#if NS_BLOCKS_AVAILABLE

- (void)accessTokenByPassword:(NSString *)password 
                     username:(NSString *)username 
                     consumer:(DOUOAuth2Consumer *)consumer
                     callback:(DOUBasicBlock)block {
  ASIFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:username forKey:kUsernameKey];
  [req setPostValue:password forKey:kPasswordKey];
  [req setCompletionBlock:block];
  [req setFailedBlock:block];
  
  [req startAsynchronous];
}


- (void)accessTokenByAuthorizationCode:(NSString *)authorizationCode
                     consumer:(DOUOAuth2Consumer *)consumer
                     callback:(DOUBasicBlock)block {
  ASIFormDataRequest *req = [self auth2Request:consumer];
  [req setPostValue:kGrantTypeAuthorizationCode forKey:kGrantTypeKey];  
  [req setPostValue:authorizationCode forKey:kOAuth2ResponseTypeCode];;
  [req setCompletionBlock:block];
  [req setFailedBlock:block];
  
  [req startAsynchronous];
}


#endif


@end
