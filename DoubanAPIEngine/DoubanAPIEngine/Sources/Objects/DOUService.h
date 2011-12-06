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
- (void)loginFailed;
@end



@class ASINetworkQueue;
@class DOUOAuth2Consumer;
@class DOUHttpRequest;
@interface DOUService : NSObject {
 @private
  ASINetworkQueue *queue_;
  DOUOAuth2Consumer *consumer_;
}

@property (nonatomic, retain) ASINetworkQueue   *queue;
@property (nonatomic, retain) DOUOAuth2Consumer *consumer;
@property (nonatomic, assign, readonly) int userId;


+ (DOUService *)sharedInstance;

+ (void)setAPIKey:(NSString *)theAPIKey;
+ (void)setRedirectUrl:(NSString *)theRedirectUrl;
+ (void)setPrivateKey:(NSString *)thePrivateKey;


- (NSError *)loginWithUsername:(NSString *)username 
                      password:(NSString *)password;

- (void)asyncLoginWithUsername:(NSString *)username 
                      password:(NSString *)password
                      delegate:(id<DOULoginDelegate>)delegate;

- (void)addRequest:(DOUHttpRequest *)request;

- (void)setMaxConcurrentOperationCount:(NSUInteger)maxConcurrentOperationCount;

@end
