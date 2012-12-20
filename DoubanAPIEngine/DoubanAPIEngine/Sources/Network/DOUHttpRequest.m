//
//  DOUHttpRequest.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "ASIHTTPRequest.h"
#import "DOUHttpRequest.h"
#import "DOUOAuth2.h"
#import "DOUQuery.h"

#import "DOUAPIConfig.h"
#import "SBJson.h"


@implementation DOUHttpRequest

NSUInteger const kDefaultTimeoutSeconds = 30;


NSString * const DOUHTTPRequestErrorDomain = @"DOUHTTPRequestErrorDomain";

NSString * const DOUOAuthErrorDomain = @"DOUOAuthErrorDomain";

NSString * const DOUErrorDomain = @"DOUErrorDomain";


+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL {
  DOUHttpRequest *req = [[[DOUHttpRequest alloc] initWithURL:URL] autorelease];
  req.useCookiePersistence = NO;
  //[req setValidatesSecureCertificate:NO];
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
  // handle the http error
  if (asiError) {
    return [[self class] adapterError:asiError];
  }
  
  int statusCode = [self responseStatusCode];
  if (statusCode == 200 || statusCode == 201 || statusCode == 202) {
    // success
    return nil;
  }
  else if (statusCode == 400) {
    // handle the oauth error
    NSString *response = [self responseString];
    NSDictionary *dic = [response JSONValue];  
    NSInteger code = 0;
    if (dic) {
      code = [[dic objectForKey:@"code"] integerValue];
    }

    if (dic) {
      NSError *oauthError = [NSError errorWithDomain:DOUOAuthErrorDomain
                                                code:code 
                                            userInfo:dic];
      return oauthError;
    }
  }
      
  NSError *otherError = [NSError errorWithDomain:DOUErrorDomain
                                            code:error.code
                                        userInfo:nil];
  return otherError;  

}

- (void)appendPostString:(NSString *)string {
	[super appendPostData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}



@end
