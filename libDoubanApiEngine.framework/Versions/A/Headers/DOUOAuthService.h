//
//  DOUOAuthService.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUService.h"


@class DOUOAuthService;
@protocol DOUOAuthServiceDelegate <NSObject>

@required

- (void)OAuthClient:(DOUOAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic;

- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error;

@end



@interface DOUOAuthService : NSObject {
 @private
@private
	NSString *clientId_;
  NSString *clientSecret_;
	NSString *authorizationCode_;
  NSString *authorizationURL_;
  NSString *callbackURL_;

  
  id<DOUOAuthServiceDelegate> delegate_;
}

@property (nonatomic, assign) id<DOUOAuthServiceDelegate> delegate;
@property (nonatomic, retain) NSString *clientId;
@property (nonatomic, retain) NSString *clientSecret;
@property (nonatomic, retain) NSString *authorizationURL;
@property (nonatomic, retain) NSString *callbackURL;
@property (nonatomic, retain) NSString *authorizationCode;


+ (id)sharedInstance;

- (void)validateAuthorizationCode;

- (void)validateUsername:(NSString *)username password:(NSString *)password;

- (NSError *)validateRefresh;


#if NS_BLOCKS_AVAILABLE

- (void)validateUsername:(NSString *)username 
                password:(NSString *)password
                callback:(DOUBasicBlock)block;

- (void)validateAuthorizationCodeWithCallback:(DOUBasicBlock)block;

#endif

- (void)logout;

@end

