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

NSUInteger const kDefaultTimeoutSeconds = 12;

NSString * const DOUHTTPRequestErrorDomain = @"DOUHTTPRequestErrorDomain";

#pragma mark - GET Request

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL {
  NSLog(@"request url:%@", [URL absoluteString]);
  //DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:URL];
  DOUHttpRequest *req = [[[DOUHttpRequest alloc] initWithURL:URL] autorelease];
  [req setTimeOutSeconds:kDefaultTimeoutSeconds];
  return req;
}

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate {
  DOUHttpRequest *req = [[self class] requestWithURL:URL];
  [req setDelegate:delegate];
  [req setDidFinishSelector:@selector(requestFinished:)];
  [req setDidFailSelector:@selector(requestFailed:)];
  return req;
}


+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate {
  DOUHttpRequest *req = [[self class] requestWithURL:[query requestURL] target:delegate];
  return req;
}

#if NS_BLOCKS_AVAILABLE
+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query 
                     completionBlock:(DOUBasicBlock)completionHandler {
  DOUHttpRequest *req = [[self class] requestWithURL:[query requestURL]];
  [req setCompletionBlock:completionHandler];
  [req setFailedBlock:completionHandler];
  return req;
}
#endif


+ (NSError *)adapterError:(NSError *)asiError {
  NSError *doubanError;
  switch ([asiError code]) {
    case ASIConnectionFailureErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUConnectionFailureErrorType 
                                    userInfo:asiError.userInfo];
      break;
    case ASIRequestTimedOutErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOURequestTimedOutErrorType 
                                    userInfo:asiError.userInfo];
    case DOUAuthenticationErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUAuthenticationErrorType 
                                    userInfo:asiError.userInfo];
    case DOURequestCancelledErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOURequestCancelledErrorType 
                                    userInfo:asiError.userInfo];
    case DOUUnableToCreateRequestErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUUnableToCreateRequestErrorType 
                                    userInfo:asiError.userInfo];
    case DOUInternalErrorWhileBuildingRequestType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUInternalErrorWhileBuildingRequestType 
                                    userInfo:asiError.userInfo];
    case DOUInternalErrorWhileApplyingCredentialsType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUInternalErrorWhileApplyingCredentialsType 
                                    userInfo:asiError.userInfo];
    case DOUFileManagementError:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUFileManagementError 
                                    userInfo:asiError.userInfo];
    case DOUTooMuchRedirectionErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUTooMuchRedirectionErrorType 
                                    userInfo:asiError.userInfo];
    case DOUUnhandledExceptionError:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain 
                                        code:DOUUnhandledExceptionError 
                                    userInfo:asiError.userInfo];
    case DOUCompressionError:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain 
                                        code:DOUCompressionError 
                                    userInfo:asiError.userInfo];
    default:
      break;
  }
  return doubanError;
} 


- (NSError *)doubanError {
  NSError *asiError = [super error];
  if (asiError == nil) {
    return asiError;
  }
  return [[self class] adapterError:asiError];
}

@end
