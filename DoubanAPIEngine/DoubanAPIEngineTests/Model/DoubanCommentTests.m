//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GDataBaseElements.h"
#import "DOUAPIEngine.h"
#import "DoubanEntryComment.h"
#import "DoubanFeedComment.h"
#import "GDataEntryBase+Extension.h"

@interface DoubanCommentTests : SenTestCase 


- (void)testDoubanFeedComment;

@end


@implementation DoubanCommentTests


- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanFeedComment {
  
  NSString *filePath = 
          [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedComment" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  DoubanFeedComment *feed = [[DoubanFeedComment alloc] initWithData:data];
  STAssertNotNil(feed, @"" );
  
  for (GDataAtomAuthor *author in [feed authors]){
    STAssertTrue([[author name] isEqualToString:@"lincode"], @"author");
  }
  
  
  STAssertTrue([[[feed title] stringValue] isEqualToString:@"照片 的回应"], @"Feed title");

  for (DoubanEntryComment *comment in feed) {
    NSLog(@"id:%@", [comment identifier]);
    if ([[comment identifier] isEqualToString:@"http://api.douban.com/recommendation/1474552938/comment/99611691"]) {
      STAssertTrue([[[comment content] stringValue] length] >= 1 , @"content");
      STAssertTrue([[[comment publishedDate] stringValue] isEqualToString:@"2012-03-22T21:23:43+08:00"], @"published");    

      GDataAtomAuthor *author = [comment theFirstAuthor];
      STAssertTrue([[author name] isEqualToString:@"放开那个西红柿"], @"author");
    }
    
    if ([[comment identifier] isEqualToString:@"http://api.douban.com/recommendation/1474552938/comment/99612528"]) {
      STAssertTrue([[[comment content] stringValue] isEqualToString:@"大众点评啦"] , @"content");

      STAssertTrue([[[comment publishedDate] stringValue] isEqualToString:@"2012-03-22T21:29:27+08:00"], @"published");
      
      GDataAtomAuthor *author = [comment theFirstAuthor];
      STAssertTrue([[author name] isEqualToString:@"lincode"], @"author");
    }

    if ([[comment identifier] isEqualToString:@"http://api.douban.com/recommendation/1474552938/comment/99624829"]) {
      STAssertTrue([[[comment content] stringValue] isEqualToString:@"不知道大叔的新店如何？"] , @"content");
      STAssertTrue([[[comment publishedDate] stringValue] isEqualToString:@"2012-03-22T22:51:50+08:00"], @"published");    
      
      GDataAtomAuthor *author = [comment theFirstAuthor];
      STAssertTrue([[author URI] isEqualToString:@"http://api.douban.com/people/1354395"], @"author uri");
      STAssertTrue([[author name] isEqualToString:@"Kirsten"], @"author name");
    }
    
  }
  
  
}


@end
