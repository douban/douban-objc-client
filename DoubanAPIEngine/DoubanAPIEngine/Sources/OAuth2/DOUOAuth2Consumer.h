//
//  DOUOAuth2Consumer.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DOUHttpRequest;
@interface DOUOAuth2Consumer : NSObject {
 @private  
  NSString	 *key_;
	NSString	 *secret_;
	NSString   *redirectURL_;
  
  NSString   *accessToken_;
  NSString   *refreshToken_;
  NSDate     *expiresIn_;
  
  int        userId_;

}

@property (nonatomic, copy, readonly) NSString *key;
@property (nonatomic, copy, readonly) NSString *secret;
@property (nonatomic, copy, readonly) NSString *redirectURL;

@property (nonatomic, copy, readonly) NSString *accessToken;
@property (nonatomic, copy, readonly) NSString *refreshToken;
@property (nonatomic, copy, readonly) NSDate *expiresIn;

@property (nonatomic, assign, readonly) int userId;



- (id)initWithKey:(NSString *)aKey secret:(NSString *)aSecret redirectURL:(NSString *)aRedirectURL;

- (void)updateWithHTTPResponse:(NSString *)aString;

- (void)updateWithUserDefaults;

- (void)sign:(DOUHttpRequest *)request;

- (BOOL)hasExpired;

- (void)save;
- (void)clear;

@end
