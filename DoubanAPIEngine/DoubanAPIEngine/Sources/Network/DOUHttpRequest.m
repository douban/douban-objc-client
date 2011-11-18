//
//  DOUHttpRequest.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUHttpRequest.h"
#import "DOUOAuth2.h"

@implementation DOUHttpRequest


- (void)addRequestHeader:(NSString *)header value:(NSString *)value {
  [super addRequestHeader:header value:value];
}


+ (DOUHttpRequest *)postRequestWithURL:(NSURL *)URL {
  return [ASIFormDataRequest requestWithURL:URL];
}


+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate {
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:URL];
  
  [req setDelegate:delegate];
  [req setDidFinishSelector:@selector(requestFinished:)];
  [req setDidFailSelector:@selector(requestFailed:)];
  return req;
}


+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"request url:%@", requestUrl);
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:[NSURL URLWithString:requestUrl]];
  return req;
}


+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"request url:%@", requestUrl);
  
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:[NSURL URLWithString:requestUrl]];
  
  [req setDelegate:delegate];
  [req setDidFinishSelector:@selector(requestFinished:)];
  [req setDidFailSelector:@selector(requestFailed:)];
  return req;
}

#if NS_BLOCKS_AVAILABLE
+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query 
                     completionBlock:(DOUBasicBlock)handler {
  NSString *requestUrl = [query requestUrl];
  NSLog(@"request url:%@", requestUrl);
  
  DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:[NSURL URLWithString:requestUrl]];

  [req setCompletionBlock:handler];

  return req;
}

#endif

@end
