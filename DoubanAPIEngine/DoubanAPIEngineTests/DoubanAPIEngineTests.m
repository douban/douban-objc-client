//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "DOUAPIConfig.h"
#import "DOUHttpRequest.h"
#import "DOUService.h"
#import "DOUQuery.h"


@interface DoubanAPIEngineTests : SenTestCase 
- (void)testDOUOAuth2Service;
- (void)testDOUService;
@end


@implementation DoubanAPIEngineTests

static NSString * const kUsernameStr = @"yourUsername@";
static NSString * const kPasswordStr = @"yourpassword";




- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [super tearDown];
}

+ (DOUQuery *)queryCurrentUser {
  NSString *subPath = @"shuo/users/@me";
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];
  return [query autorelease];
}

+ (DOUQuery *)queryUserWithId:(NSUInteger)userId {
  NSString *subPath = [NSString stringWithFormat:@"shuo/users/%d", userId];
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];
  return [query autorelease];
}


+ (DOUQuery *)queryActivityWithId:(NSUInteger)activityId {
  NSString *subPath = [NSString stringWithFormat:@"event/%d", activityId];
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"json",@"alt", nil];
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:params];
  return [query autorelease];
}


+ (DOUQuery *)queryBookWithId:(int)bookId {
  NSString *subPath = [NSString stringWithFormat:@"book/subject/%d", bookId];
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"json",@"alt", nil];
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:params];
  return [query autorelease];
}


- (void)testDOUOAuth2Service {

  DOUService *service = [[DOUService alloc] init];

  [service loginWithUsername:kUsernameStr password:kPasswordStr];  

  NSLog(@"key: %@", service.consumer.key);
  NSLog(@"secret: %@", service.consumer.secret);
  NSLog(@"token: %@", service.consumer.accessToken);
  NSLog(@"refresh token: %@", service.consumer.refreshToken);
  NSLog(@"expiry: %@", service.consumer.expiresIn);
  
  //DOUQuery *query = [[self class] queryCurrentUser];
  DOUQuery *query = [[self class] queryBookWithId:6861929];
  DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query];
  
  [service.consumer sign:req];
    
  NSDictionary *headers = [req requestHeaders];
  for (NSString *key in [headers allKeys]) {
    NSLog(@"header pair: %@/%@", key, [headers objectForKey:key]);
  }
  
  
  [req startSynchronous];
  if (![req error]) {
    NSString* responseStr = [req responseString];
    NSLog(@"response :%@",responseStr);
  }
  
}


/*
- (void)testDOUService {

  DOUService *service = [DOUService sharedInstance];
  DOUQuery *query = [[self class] queryActivityWithId:14910931];
  //DOUQuery *query = [[self class] queryBookWithId:6861929];
  //DOUQuery *query = [[self class] queryUserWithId:service.consumer.userId];
  DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query];
  [service.consumer sign:req];
  
  NSLog(@"key: %@", service.consumer.key);
  NSLog(@"secret: %@", service.consumer.secret);
  NSLog(@"token: %@", service.consumer.accessToken);
  NSLog(@"refresh token: %@", service.consumer.refreshToken);
  NSLog(@"expiry: %@", service.consumer.expiresIn);
  
  [req startSynchronous];
  if (![req error]) {
    NSString *str = [req responseString];
    NSLog(@"response:%@", str);
  }
}
*/

@end
