//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GDataBaseElements.h"
#import "DoubanAttribute.h"
#import "DOUAPIEngine.h"
#import "DoubanEntryMiniblog.h"
#import "DoubanFeedMiniblog.h"
#import "DoubanDefines.h"

#import "GDataAtomAuthor+Extension.h"
#import "GDataLink.h"
#import "GDataEntryBase.h"
#import "GDataEntryBase+Extension.h"


@interface DoubanMiniblogTests : SenTestCase 

- (void)testDoubanEntryMiniblog;

- (void)testDoubanFeedMiniblog;

@end


@implementation DoubanMiniblogTests


- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanEntryMiniblog {

  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntryMiniblog" 
                                                                        ofType:@"xml"];  

  if (!filePath)
    STAssertTrue(FALSE, @"filePath fail!");
    
  NSData *data = [NSData dataWithContentsOfFile:filePath];

  DoubanEntryMiniblog *miniblog= [[[DoubanEntryMiniblog alloc] initWithData:data] autorelease];
  
  GDataAtomAuthor *author = [miniblog theFirstAuthor];

  STAssertTrue([[author name] isEqualToString:@"挑灯看剑"], @"author name");
  
  GDataLink *link = [author linkWithRelAttributeValue:@"icon"];
  
  NSURL *url = [link URL];
  STAssertTrue([[url absoluteString] isEqualToString:@"http://t.douban.com/icon/u1079441-7.jpg"], @"author icon");
  
  STAssertTrue([[[miniblog title] stringValue] isEqualToString:@"上传了一张照片到临时存放"]  , @"title");
  STAssertTrue([[miniblog identifier] isEqualToString:@"http://api.douban.com/miniblog/12974354"], @"identifier");
  STAssertTrue([[[miniblog content] stringValue] length] >= 1 , @"content");
  STAssertTrue([[[miniblog publishedDate] stringValue] isEqualToString:@"2008-07-29T15:10:29+08:00"], @"published");
}


- (void)testDoubanFeedMiniblog {
  
  NSString *filePath = 
          [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedMiniblog" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  DoubanFeedMiniblog *feed = [[DoubanFeedMiniblog alloc] initWithData:data];
  STAssertNotNil(feed, @"" );
  
  for (GDataAtomAuthor *author in [feed authors]){
    STAssertTrue([[author name] isEqualToString:@"胖胖的大头鱼"], @"author");
  }
  
  
  STAssertTrue([[[feed title] stringValue] isEqualToString:@"胖胖的大头鱼 的友邻广播"], @"Feed title");

  for (DoubanEntryMiniblog *miniblog in feed) {
    
    if ([[miniblog identifier] isEqualToString:@"http://api.douban.com/miniblog/12974400"]) {
      STAssertTrue([miniblog miniblogCategory] == MINIBLOG_BLOG_CATEGORY, @"");
      STAssertTrue([[[miniblog title] stringValue] isEqualToString:@"写了新blog文章第一批北京志愿者的工作情况"]  , @"title");
      STAssertTrue([[[miniblog content] stringValue] length] >= 1 , @"content");
      STAssertTrue([[[miniblog publishedDate] stringValue] isEqualToString:@"2008-07-31T11:57:47+08:00"], @"published");    
      
      for (GDataAtomAuthor *author in [miniblog authors]){
        STAssertTrue([[author name] isEqualToString:@"Davies"], @"author");
      }
    }
    
    if ([[miniblog identifier] isEqualToString:@"http://api.douban.com/miniblog/12974395"]) {
      STAssertTrue([miniblog miniblogCategory] == MINIBLOG_GROUP_CATEGORY, @"");
      STAssertTrue([[[miniblog title] stringValue] isEqualToString:@"加入了岩井俊二小组"]  , @"title");
      STAssertTrue([[[miniblog content] stringValue] length] >= 1 , @"content");
      STAssertTrue([[[miniblog publishedDate] stringValue] isEqualToString:@"2008-07-30T21:45:35+08:00"], @"published");    
       

      for (GDataAtomAuthor *author in [miniblog authors]){
        STAssertTrue([[author name] isEqualToString:@"挑灯看剑"], @"author");
      }
    }
  }
  
  
}


@end
