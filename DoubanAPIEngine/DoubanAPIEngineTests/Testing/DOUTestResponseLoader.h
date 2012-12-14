//
//  DOUTestResponseLoader.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/17/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUHttpRequest.h"
#import "DOUOAuthService.h"


/**
 为 DOUHttpRequest 提供异步测试支持
 */
@interface DOUTestResponseLoader : NSObject<DOUOAuthServiceDelegate>


@property (nonatomic, readonly, getter = wasSuccessful) BOOL successful;

@property (nonatomic, readonly, getter = wasCancelled) BOOL cancelled;

@property (nonatomic, readonly, getter = loadedUnexpectedResponse) BOOL unexpectedResponse;

@property (nonatomic, copy, readonly) NSError *error;

@property (nonatomic, assign) NSTimeInterval timeout;

+ (id)responseLoader;

- (void)waitForResponse;

- (NSString *)errorMessage;

@end
