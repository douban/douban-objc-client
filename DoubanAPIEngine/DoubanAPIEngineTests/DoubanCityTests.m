//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DoubanEntryCity.h"
#import "DoubanFeedCity.h"

@interface DoubanCityTests : SenTestCase 

- (void)testDoubanEntryCity;

- (void)testDoubanFeedCity;

@end


@implementation DoubanCityTests

- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanEntryCity {

  NSString *filePath = 
            [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntryCity" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"filePath fail!");
    
  NSData *data = [NSData dataWithContentsOfFile:filePath];
    
  DoubanEntryCity *city = [[DoubanEntryCity alloc] initWithData:data]; 
  STAssertTrue([[[city title] stringValue] isEqualToString:@"上海"] , @"path fail");
  STAssertTrue([[city name] isEqualToString:@"上海"] , @"path fail");
  STAssertTrue([city isHabitable] , @"isHabitable");
  
}


- (void)testDoubanFeedCity {
  
  NSString *filePath = 
          [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedCity" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  DoubanFeedCity *feed = [[DoubanFeedCity alloc] initWithData:data];
  STAssertTrue([[[feed title] stringValue] isEqualToString:@"活动热门城市"], @"feed title");
  for (DoubanEntryCity * city in feed) {
    
    if ([[[city title] stringValue] isEqualToString:@"北京"]) {
      STAssertTrue([[[city title] stringValue] isEqualToString:@"北京"] , @"path fail");
      STAssertTrue([[city name] isEqualToString:@"北京"] , @"path fail");
      STAssertTrue([city isHabitable] , @"isHabitable");
    }
  }
  
}


@end
