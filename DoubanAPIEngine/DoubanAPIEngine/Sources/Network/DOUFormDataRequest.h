//
//  DOUFormDataRequest.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-24.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "DOUQuery.h"
#import "DOUOAuth2Consumer.h"
#import "DOUHttpRequest.h"


//
// DOUFormDataRequest is the wrapper of ASIFormDataRequest
//
@interface DOUFormDataRequest : ASIFormDataRequest


- (void)addRequestHeader:(NSString *)header value:(NSString *)value;


+ (DOUFormDataRequest *)formRequestWithURL:(NSURL *)URL;

+ (DOUFormDataRequest *)formRequestWithURL:(NSURL *)URL target:(id<DOUHttpRequestDelegate>)delegate;

+ (DOUFormDataRequest *)formRequestWithQuery:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate;

#if NS_BLOCKS_AVAILABLE
+ (DOUFormDataRequest *)formRequestWithQuery:(DOUQuery *)query 
                             completionBlock:(DOUBasicBlock)handler;
#endif

- (NSError *)doubanError;

@end
