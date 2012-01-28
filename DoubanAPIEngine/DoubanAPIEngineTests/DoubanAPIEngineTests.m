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
#import "DoubanEntrySubject.h"

@interface DoubanAPIEngineTests : SenTestCase 

- (void)testDOUOAuth2Service;

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
  NSString *subPath = @"/shuo/users/@me";
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];
  return [query autorelease];
}

+ (DOUQuery *)queryUserWithId:(NSUInteger)userId {
  NSString *subPath = [NSString stringWithFormat:@"/shuo/users/%d", userId];
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];
  return [query autorelease];
}


+ (DOUQuery *)queryActivityWithId:(NSUInteger)activityId {
  NSString *subPath = [NSString stringWithFormat:@"/event/%d", activityId];
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"json",@"alt", nil];
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:params];
  return [query autorelease];
}


+ (DOUQuery *)queryBookWithId:(int)bookId {
  NSString *subPath = [NSString stringWithFormat:@"/book/subject/%d", bookId];
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"xml",@"alt", nil];
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:params];
  return [query autorelease];
}


- (void)testDOUOAuth2Service {
  
}



@end
