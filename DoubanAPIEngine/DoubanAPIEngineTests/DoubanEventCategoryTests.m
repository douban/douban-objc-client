//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DoubanEntryEventCategory.h"
#import "DoubanFeedEventCategory.h"


@interface DoubanEventCategoryTests : SenTestCase 

- (void)testDoubanFeedEventCategory;

@end


@implementation DoubanEventCategoryTests

- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanFeedEventCategory {
  
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedEventCategory" 
                                                                        ofType:@"xml"];  
  if (filePath) {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    DoubanFeedEventCategory *feed = [[DoubanFeedEventCategory alloc] initWithData:data];
    NSLog(@"feed title: %@", [[feed title] stringValue]);
    STAssertTrue([[[feed title] stringValue] isEqualToString:@"北京的活动数目"], @"title");
    
    NSArray *categories = [feed entries];
    STAssertTrue([categories count] == 11, @"category count");
    
    for (DoubanEntryEventCategory *category in categories) {
      if ([[[category title] stringValue] isEqualToString:@"all"]) {
        STAssertTrue([category eventCount] == 781, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"所有类型"] , @"eventCateogryName");
      }
      
      if ([[[category title] stringValue] isEqualToString:@"drama"]) {
        STAssertTrue([category eventCount] == 51, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"戏剧/曲艺"] , @"eventCateogryName");
       }
      
      if ([[[category title] stringValue] isEqualToString:@"music"]) {
        STAssertTrue([category eventCount] == 105, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"音乐/演出"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"exhibition"]) {
        STAssertTrue([category eventCount] == 100, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"展览"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"sports"]) {
        STAssertTrue([category eventCount] == 46, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"体育"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"party"]) {
        STAssertTrue([category eventCount] == 156, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"生活/聚会"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"commonweal"]) {
        STAssertTrue([category eventCount] == 56, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"公益"] , @"eventCateogryName");
      }
      
      if ([[[category title] stringValue] isEqualToString:@"travel"]) {
        STAssertTrue([category eventCount] == 28, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"旅行"] , @"eventCateogryName");
      }
      
      
      if ([[[category title] stringValue] isEqualToString:@"film"]) {
        STAssertTrue([category eventCount] == 37, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"电影"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"salon"]) {
        STAssertTrue([category eventCount] == 132, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"讲座/沙龙"] , @"eventCateogryName");
      }
      
      if ([[[category title] stringValue] isEqualToString:@"others"]) {
        STAssertTrue([category eventCount] == 70, @"eventsCount");
        STAssertTrue([[category eventCateogryName] isEqualToString:@"其他"] , @"eventCateogryName");
      }
      
    }
  }

}


@end
