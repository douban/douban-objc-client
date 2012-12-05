//
//  DOUHttpRequest.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"


extern NSUInteger const kDefaultTimeoutSeconds;

extern NSString * const DOUHTTPRequestErrorDomain;

extern NSString * const DOUOAuthErrorDomain;

extern NSString * const DOUErrorDomain;

@class DOUHttpRequest;
@class DOUQuery;
@protocol DOUHttpRequestDelegate <NSObject>

@required
- (void)requestFinished:(DOUHttpRequest *)aRequest;
- (void)requestFailed:(DOUHttpRequest *)aRequest;
@end


typedef enum _DOUNetworkErrorType {
  DOUConnectionFailureErrorType = 1,
  DOURequestTimedOutErrorType = 2,
  DOUAuthenticationErrorType = 3,
  DOURequestCancelledErrorType = 4,
  DOUUnableToCreateRequestErrorType = 5,
  DOUInternalErrorWhileBuildingRequestType  = 6,
  DOUInternalErrorWhileApplyingCredentialsType  = 7,
	DOUFileManagementError = 8,
	DOUTooMuchRedirectionErrorType = 9,
	DOUUnhandledExceptionError = 10,
	DOUCompressionError = 11
} DOUNetworkErrorType;



#if NS_BLOCKS_AVAILABLE
typedef void (^DOUBasicBlock)(void);

typedef void (^DOUReqBlock)(DOUHttpRequest *);

typedef void (^DOUSizeBlock)(long long size);
#endif

//
// DOUHttpRequest is the wrapper of http request, now it's ASIHTTPRequest.
//
@interface DOUHttpRequest : ASIHTTPRequest

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL;

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate;

+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate;

#if NS_BLOCKS_AVAILABLE
+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL 
                     completionBlock:(DOUBasicBlock)completionHandler;

+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query 
                     completionBlock:(DOUBasicBlock)completionHandler;
#endif

+ (NSError *)adapterError:(NSError *)asiError;

- (NSError *)doubanError;

- (void)appendPostString:(NSString *)string;

@end




