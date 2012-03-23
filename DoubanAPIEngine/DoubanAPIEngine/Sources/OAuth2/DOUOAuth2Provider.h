//
//  DOUOAuth2Request.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUOAuth2Consumer.h"
#import "DOUService.h"

@interface DOUOAuth2Provider : NSObject {
 @private
  NSString *authURL_;
  NSString *tokenURL_;
}

- (id)initWithAuthURL:(NSString *)anAuthURL tokenURL:(NSString *)aTokenURL;

- (void)accessTokenByPassword:(DOUOAuth2Consumer *)consumer 
                     username:(NSString *)username 
                     password:(NSString *)password
                     delegate:(id<DOUHttpRequestDelegate>)delegate;

- (NSError *)accessTokenByRefresh:(DOUOAuth2Consumer *)consumer;

/*
- (void)accessTokenByAuthorizationCode:(DOUOAuth2Consumer *)consumer 
                     authorizationCode:(NSString *)authorizationCode;
*/

#if NS_BLOCKS_AVAILABLE

- (void)accessTokenByPassword:(DOUOAuth2Consumer *)consumer 
                     username:(NSString *)username 
                     password:(NSString *)password
                     callback:(DOUBasicBlock)block;

#endif


@end
