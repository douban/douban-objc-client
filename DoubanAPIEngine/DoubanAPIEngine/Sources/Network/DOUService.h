//
//  DOUService.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUHttpRequest.h"
#import "GDataEntryBase.h"
#import "DoubanEntryPhoto.h"


@class ASINetworkQueue;
@class DOUOAuth2Consumer;
@class DOUOAuth2Provider;
@class DOUHttpRequest;
@interface DOUService : NSObject {
 @private
  ASINetworkQueue *queue_;
  DOUOAuth2Consumer *consumer_;
  DOUOAuth2Provider *provider_;
}


@property (nonatomic, retain) ASINetworkQueue   *queue;
@property (nonatomic, retain) DOUOAuth2Consumer *consumer;
@property (nonatomic, retain) DOUOAuth2Provider *provider;


+ (DOUService *)sharedInstance;

+ (NSString *)apiKey;
+ (void)setAPIKey:(NSString *)theAPIKey;
+ (void)setRedirectUrl:(NSString *)theRedirectUrl;
+ (void)setPrivateKey:(NSString *)thePrivateKey;

- (void)addRequest:(DOUHttpRequest *)request;

- (void)setMaxConcurrentOperationCount:(NSUInteger)maxConcurrentOperationCount;

- (NSString *)accessToken;

- (int)userId;

- (BOOL)isValid;

- (NSError *)executeRefreshToken;

- (void)logout;

#if NS_BLOCKS_AVAILABLE

- (void)loginWithUsername:(NSString *)username 
                 password:(NSString *)password
                 callback:(DOUBasicBlock)block;

- (void)get:(DOUQuery *)query callback:(DOUReqBlock)block;

- (void)post:(DOUQuery *)query callback:(DOUReqBlock)block;

- (void)post:(DOUQuery *)query object:(GDataEntryBase *)object callback:(DOUReqBlock)block;

- (void)post:(DOUQuery *)query 
   photoData:(NSData *)photoData
      format:(NSString *)format
 description:(NSString *)description
    callback:(DOUReqBlock)block;

- (void)del:(DOUQuery *)query callback:(DOUReqBlock)block;

#endif


- (void)loginWithUsername:(NSString *)username 
                 password:(NSString *)password
                 delegate:(id<DOUHttpRequestDelegate>)delegate;

- (void)get:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate;

- (void)post:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate;

- (void)post:(DOUQuery *)query object:(GDataEntryBase *)object target:(id<DOUHttpRequestDelegate>)delegate;

- (void)del:(DOUQuery *)query target:(id<DOUHttpRequestDelegate>)delegate;


@end
