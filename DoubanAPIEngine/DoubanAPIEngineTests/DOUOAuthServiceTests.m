//
//  DOUOAuthServiceTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/20/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUAPIEngine.h"
#import "DOUTestResponseLoader.h"





static NSString * const kAPIKey = @"0339b495d888705009ad1dc1899950f0";
static NSString * const kPrivateKey = @"69f50280e68a742a";
static NSString * const kRedirectUrl = @"http://www.douban.com/location/mobile";


@interface DOUOAuthServiceTests : SenTestCase

@end




@implementation DOUOAuthServiceTests


//- (void)testOAuthServiceByAuthorizationCode {
//  DOUTestResponseLoader *loader = [DOUTestResponseLoader responseLoader];
//  [loader setTimeout:10];
//  DOUOAuthService* service = [DOUOAuthService clientWithClientID:@"appID" secret:@"appSecret"];
//  
//  service.delegate = loader;
//  service.authorizationURL = kTokenUrl;
//  service.authorizationCode = @"someInvalidAuthorizationCode";
//  service.callbackURL = kRedirectUrl;
//  [service validateAuthorizationCode];
//  [loader waitForResponse];
//}


- (void)testOAuthServiceByUsernameAndPassword {
  DOUTestResponseLoader *loader = [DOUTestResponseLoader responseLoader];
  [loader setTimeout:10];
  
  DOUOAuthService* service = [DOUOAuthService sharedInstance];
  service.clientId = kAPIKey;
  service.clientSecret = kPrivateKey;
  
  service.delegate = loader;
  service.authorizationURL = @"https://www.douban.com/service/auth2/token";
  service.callbackURL = kRedirectUrl;
  
  [service validateUsername:@"ruhan@douban.com" password:@"ruhan"];
  [loader waitForResponse];
  STAssertTrue(loader.wasSuccessful == YES, @"");
}


@end
