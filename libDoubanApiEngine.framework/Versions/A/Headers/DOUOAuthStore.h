//
//  DOUOAuthStore.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DOUOAuthStore : NSObject {
 @private  
  NSString   *accessToken_;
  NSString   *refreshToken_;
  NSDate     *expiresIn_;
  int        userId_;
}


@property (nonatomic, copy, readonly) NSString *accessToken;
@property (nonatomic, copy, readonly) NSString *refreshToken;
@property (nonatomic, copy, readonly) NSDate *expiresIn;

@property (nonatomic, assign, readonly) int userId;

+ (id)sharedInstance;


- (void)updateWithSuccessDictionary:(NSDictionary *)dic;

- (BOOL)hasExpired;

// refresh token one day before token is expired.
- (BOOL)shouldRefreshToken;

- (void)save;

- (void)clear;

@end
