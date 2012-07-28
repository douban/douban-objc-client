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
        STAssertTrue([category eventsCount] == 781, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"所有类型"] , @"eventCateogryName");
      }
      
      if ([[[category title] stringValue] isEqualToString:@"drama"]) {
        STAssertTrue([category eventsCount] == 51, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"戏剧/曲艺"] , @"eventCateogryName");
       }
      
      if ([[[category title] stringValue] isEqualToString:@"music"]) {
        STAssertTrue([category eventsCount] == 105, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"音乐/演出"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"exhibition"]) {
        STAssertTrue([category eventsCount] == 100, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"展览"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"sports"]) {
        STAssertTrue([category eventsCount] == 46, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"体育"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"party"]) {
        STAssertTrue([category eventsCount] == 156, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"生活/聚会"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"commonweal"]) {
        STAssertTrue([category eventsCount] == 56, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"公益"] , @"eventCateogryName");
      }
      
      if ([[[category title] stringValue] isEqualToString:@"travel"]) {
        STAssertTrue([category eventsCount] == 28, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"旅行"] , @"eventCateogryName");
      }
      
      
      if ([[[category title] stringValue] isEqualToString:@"film"]) {
        STAssertTrue([category eventsCount] == 37, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"电影"] , @"eventCateogryName");
      }

      if ([[[category title] stringValue] isEqualToString:@"salon"]) {
        STAssertTrue([category eventsCount] == 132, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"讲座/沙龙"] , @"eventCateogryName");
      }
      
      if ([[[category title] stringValue] isEqualToString:@"others"]) {
        STAssertTrue([category eventsCount] == 70, @"eventsCount");
        STAssertTrue([[category name] isEqualToString:@"其他"] , @"eventCateogryName");
      }
      
    }
  }

}


@end
