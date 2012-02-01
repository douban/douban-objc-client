//
//  DOUService.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DOULoginDelegate <NSObject>

- (void)loginFinished;
- (void)loginFailed:(NSInteger)errorCode;
@end


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

+ (void)setAPIKey:(NSString *)theAPIKey;
+ (void)setRedirectUrl:(NSString *)theRedirectUrl;
+ (void)setPrivateKey:(NSString *)thePrivateKey;

- (void)loginWithUsername:(NSString *)username 
                 password:(NSString *)password
                 delegate:(id<DOULoginDelegate>)delegate;

- (void)logout;

- (NSError *)executeRefreshToken;

- (void)addRequest:(DOUHttpRequest *)request;

- (void)setMaxConcurrentOperationCount:(NSUInteger)maxConcurrentOperationCount;

- (NSString *)accessToken;

- (int)userId;

- (BOOL)isValid;

@end
