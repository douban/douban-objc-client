//
//  DoubanRecommendationTests.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GDataBaseElements.h"

#import "DoubanEntryRecommendation.h"
#import "DoubanFeedRecommendation.h"

@interface DoubanRecommendationTests : SenTestCase 
- (void)testDoubanEntryRecommendation;
- (void)testDoubanFeedRecommendation;
@end


@implementation DoubanRecommendationTests

- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanEntryRecommendation {
  
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntryRecommendation" 
                                                                        ofType:@"xml"];
  
  if (!filePath)
    STAssertTrue(FALSE, @"filePath fail!");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  DoubanEntryRecommendation *recomm = [[DoubanEntryRecommendation alloc] initWithData:data];
  
  if (data) {
    STAssertTrue([[[recomm title] stringValue] isEqualToString:@"推荐喵喵喵"]  , @"title");
    STAssertTrue([[recomm identifier] isEqualToString:@"http://api.douban.com/recommendation/3673470"], @"identifier");
    
    STAssertTrue([[[recomm publishedDate] stringValue] isEqualToString:@"2008-11-07T08:28:40+08:00"], @"published");

    STAssertTrue([recomm commentsCount] ==  6 , @"comment count");
    STAssertTrue([[recomm comment] isEqualToString:@"团子，我家团子，以前觉得她小时候很丑，现在觉得一 点也不丑啊～哇哈哈哈"] , @"comment");
    STAssertTrue([[recomm category] isEqualToString:@"photo_album"] , @"category");
  }  
}


- (void)testDoubanFeedRecommendation { 
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedRecommendation" 
                                                                        ofType:@"xml"];
  
  if (!filePath)
    STAssertTrue(FALSE, @"filePath fail!");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  
  if (data) {
    DoubanFeedRecommendation *feed = [[DoubanFeedRecommendation alloc] initWithData:data];
    STAssertTrue([[[feed title] stringValue] isEqualToString:@"胖胖的大头鱼 的推荐"], @"title");
    NSArray *recomms = [feed entries];
    STAssertTrue([recomms count] == 1, @"");
    
    DoubanEntryRecommendation *recomm = [recomms objectAtIndex:0];
    STAssertTrue([[[recomm title] stringValue] isEqualToString:@"推荐麦凯恩的败选演说——2008美国大选之夜（上）"]  , @"title");
    STAssertTrue([[recomm identifier] isEqualToString:@"http://api.douban.com/recommendation/3677685"], @"identifier");
    STAssertTrue([[[recomm publishedDate] stringValue] isEqualToString:@"2008-11-07T13:36:05+08:00"], @"published");
    STAssertTrue([recomm commentsCount] ==  0 , @"comment count");
    STAssertTrue([[recomm comment] isEqualToString:@""] , @"comment");
    STAssertTrue([[recomm category] isEqualToString:@"entry"] , @"category");
  }
}


@end
