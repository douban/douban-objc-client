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

- (void)accessTokenByPassword:(NSString *)password
                     username:(NSString *)username 
                     consumer:(DOUOAuth2Consumer *)consumer
                     delegate:(id<DOUHttpRequestDelegate>)delegate;

- (void)accessTokenByAuthorizationCode:(NSString *)authorizationCode
                              consumer:(DOUOAuth2Consumer *)consumer
                              delegate:(id<DOUHttpRequestDelegate>)delegate;

- (NSError *)accessTokenByRefresh:(DOUOAuth2Consumer *)consumer;


#if NS_BLOCKS_AVAILABLE

- (void)accessTokenByPassword:(NSString *)password 
                     username:(NSString *)username 
                     consumer:(DOUOAuth2Consumer *)consumer
                     callback:(DOUBasicBlock)block;

- (void)accessTokenByAuthorizationCode:(NSString *)authorizationCode
                              consumer:(DOUOAuth2Consumer *)consumer
                              callback:(DOUBasicBlock)block;

#endif


@end
