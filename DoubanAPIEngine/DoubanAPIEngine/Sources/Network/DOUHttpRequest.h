//
//  DOUHttpRequest.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "DOUQuery.h"
#import "DOUOAuth2Consumer.h"

@protocol DOUHttpRequestDelegate <NSObject>

@required
- (void)requestFinished:(DOUHttpRequest *)aRequest;
- (void)requestFailed:(DOUHttpRequest *)aRequest;
@end


#if NS_BLOCKS_AVAILABLE
typedef void (^DOUBasicBlock)(void);
#endif

//
// DOUHttpRequest is the wrapper of network utilities, now it's ASIHTTPRequest
//
@interface DOUHttpRequest : ASIFormDataRequest

- (void)addRequestHeader:(NSString *)header value:(NSString *)value;


+ (DOUHttpRequest *)formRequestWithURL:(NSURL *)URL;

+ (DOUHttpRequest *)formRequestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate;

+ (DOUHttpRequest *)formRequestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate;

#if NS_BLOCKS_AVAILABLE
+ (DOUHttpRequest *)formRequestWithQuery:(DOUQuery *)query 
                         completionBlock:(DOUBasicBlock)handler;
#endif



+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL;

+ (DOUHttpRequest *)requestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate;

+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate;

#if NS_BLOCKS_AVAILABLE
+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query 
                     completionBlock:(DOUBasicBlock)handler;
#endif


@end




