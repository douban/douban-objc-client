//
//  DOUFormDataRequest.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-24.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUFormDataRequest.h"

@implementation DOUFormDataRequest

- (void)addRequestHeader:(NSString *)header value:(NSString *)value {
  [super addRequestHeader:header value:value];
}

#pragma mark - POST Request

+ (DOUFormDataRequest *)formRequestWithURL:(NSURL *)URL {
  NSLog(@"Form url:%@", [URL absoluteString]);
  DOUFormDataRequest *req = [ASIFormDataRequest requestWithURL:URL];
  [req setAllowCompressedResponse:YES]; // YES is the default
  [req setTimeOutSeconds:kDefaultTimeoutSeconds];
  return req;
}


+ (DOUFormDataRequest *)formRequestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate {
  DOUFormDataRequest *req = [[self class] formRequestWithURL:URL];
  [req setDelegate:delegate];
  [req setDidFinishSelector:@selector(requestFinished:)];
  [req setDidFailSelector:@selector(requestFailed:)];
  return req;
}


+ (DOUFormDataRequest *)formRequestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate {
  DOUFormDataRequest *req = [[self class] formRequestWithURL:[query requestURL] target:delegate];
  return req;
}


#if NS_BLOCKS_AVAILABLE
+ (DOUFormDataRequest *)formRequestWithQuery:(DOUQuery *)query 
                         completionBlock:(DOUBasicBlock)handler {
  DOUFormDataRequest *req = [[self class] formRequestWithURL:[query requestURL]];  
  [req setCompletionBlock:handler];
  [req setFailedBlock:handler];
  return req;
}
#endif

- (NSError *)doubanError {
  NSError *asiError = [super error];
  if (asiError == nil) {
    return asiError;
  }
  return [[self class] adapterError:asiError];
}

@end
