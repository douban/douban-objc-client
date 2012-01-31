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


+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL {
  NSLog(@"request url:%@", [URL absoluteString]);
  //DOUHttpRequest *req = (DOUHttpRequest *)[ASIHTTPRequest requestWithURL:URL];
  DOUHttpRequest *req = [[[DOUHttpRequest alloc] initWithURL:URL] autorelease];
  [req setAllowCompressedResponse:YES];// YES is the default
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

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL 
                   completionBlock:(DOUBasicBlock)completionHandler {
  DOUHttpRequest *req = [[self class] requestWithURL:URL];
  [req setCompletionBlock:completionHandler];
  [req setFailedBlock:completionHandler];
  return req;
}


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
         break;
    case DOUAuthenticationErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUAuthenticationErrorType 
                                    userInfo:asiError.userInfo];
         break;
    case DOURequestCancelledErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOURequestCancelledErrorType 
                                    userInfo:asiError.userInfo];
         break;
    case DOUUnableToCreateRequestErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUUnableToCreateRequestErrorType 
                                    userInfo:asiError.userInfo];
         break;
    case DOUInternalErrorWhileBuildingRequestType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUInternalErrorWhileBuildingRequestType 
                                    userInfo:asiError.userInfo];
         break;
    case DOUInternalErrorWhileApplyingCredentialsType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUInternalErrorWhileApplyingCredentialsType 
                                    userInfo:asiError.userInfo];
         break;
    case DOUFileManagementError:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUFileManagementError 
                                    userInfo:asiError.userInfo];
         break;
    case DOUTooMuchRedirectionErrorType:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain
                                        code:DOUTooMuchRedirectionErrorType 
                                    userInfo:asiError.userInfo];
         break;
    case DOUUnhandledExceptionError:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain 
                                        code:DOUUnhandledExceptionError 
                                    userInfo:asiError.userInfo];
      break;
    case DOUCompressionError:
      doubanError = [NSError errorWithDomain:DOUHTTPRequestErrorDomain 
                                        code:DOUCompressionError 
                                    userInfo:asiError.userInfo];
      break;
    default:
      doubanError = asiError;
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
