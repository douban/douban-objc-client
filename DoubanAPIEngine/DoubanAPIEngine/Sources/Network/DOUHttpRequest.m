//
//  DOUHttpRequest.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUHttpRequest.h"
#import "DOUOAuth2.h"
#import "DOUAPIConfig.h"

@implementation DOUHttpRequest




- (void)addRequestHeader:(NSString *)header value:(NSString *)value {
  [super addRequestHeader:header value:value];
}

#pragma mark - POST Request

+ (DOUHttpRequest *)formRequestWithURL:(NSURL *)URL {
  DOUHttpRequest *req = [ASIFormDataRequest requestWithURL:URL];
  [req setTimeOutSeconds:kTimeoutSeconds];
  return req;
}


+ (DOUHttpRequest *)formRequestWithQuery:(DOUQuery *)query {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"Form request:%@", requestUrl);
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIFormDataRequest requestWithURL:[NSURL URLWithString:requestUrl]];
  [req setTimeOutSeconds:kTimeoutSeconds];
  return req;
}

+ (DOUHttpRequest *)formRequestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate {

  DOUHttpRequest *req = (DOUHttpRequest *)[ASIFormDataRequest requestWithURL:URL];
  [req setTimeOutSeconds:kTimeoutSeconds];
  [req setDelegate:delegate];
  [req setDidFinishSelector:@selector(requestFinished:)];
  [req setDidFailSelector:@selector(requestFailed:)];
  return req;
}


+ (DOUHttpRequest *)formRequestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"Form request:%@", requestUrl);
  DOUHttpRequest *req = [self formRequestWithURL:[NSURL URLWithString:requestUrl] target:delegate];
  return req;
}

#if NS_BLOCKS_AVAILABLE
+ (DOUHttpRequest *)formRequestWithQuery:(DOUQuery *)query 
                         completionBlock:(DOUBasicBlock)handler {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"post url:%@", requestUrl);
  
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIFormDataRequest requestWithURL:[NSURL URLWithString:requestUrl]];  
  [req setTimeOutSeconds:kTimeoutSeconds];
  [req setCompletionBlock:handler];
  return req;
}
#endif



#pragma mark - GET Request

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL {
  DOUHttpRequest * req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:URL];
  [req setTimeOutSeconds:kTimeoutSeconds];
  return req;
}

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate {
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:URL];
    [req setTimeOutSeconds:kTimeoutSeconds];
  [req setDelegate:delegate];
  [req setDidFinishSelector:@selector(requestFinished:)];
  [req setDidFailSelector:@selector(requestFailed:)];
  return req;
}


+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"get url:%@", requestUrl);
  DOUHttpRequest *req = [self requestWithURL:[NSURL URLWithString:requestUrl] target:delegate];
  return req;
}

#if NS_BLOCKS_AVAILABLE
+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query 
                     completionBlock:(DOUBasicBlock)handler {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"get url:%@", requestUrl);
  
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:[NSURL URLWithString:requestUrl]];
  [req setTimeOutSeconds:kTimeoutSeconds];
  [req setCompletionBlock:handler];

  return req;
}
#endif


@end
