//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "DoubanEntryPeople.h"
#import "DoubanFeedPeople.h"
#import "GDataBaseElements.h"
#import "DoubanUID.h"
#import "DoubanSignature.h"
#import "DoubanLocation.h"


@interface DoubanPeopleTests : SenTestCase 

- (void)testDoubanEntryPeople;

- (void)testDoubanFeedPeople;

@end


@implementation DoubanPeopleTests

- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanEntryPeople {

  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntryPeople" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"filePath fail!");
    
  NSData *data = [NSData dataWithContentsOfFile:filePath];
    
  DoubanEntryPeople *people = [[DoubanEntryPeople alloc] initWithData:data]; 

  STAssertTrue([[people.location identity] isEqualToString:@"beijing"], @"location"); 
    
  STAssertTrue([[people.location content] isEqualToString:@"北京"], @"location"); 
  STAssertTrue([[people.uid content] isEqualToString:@"ahbei"], @"ahbei");
  
  STAssertTrue([[people.signature content] isEqualToString:@"风骚为人"], @"signature");
  
  STAssertTrue([people.identifier isEqualToString:@"http://api.douban.com/people/ahbei"], @"identifier");
  STAssertTrue([[people.title stringValue] isEqualToString:@"阿北"], @"title");
  STAssertTrue([[people.content stringValue] length] > 0, @"content");
  
  NSString * imageUrlStr = [[people.iconLink URL] absoluteString]; 
  STAssertTrue([imageUrlStr isEqualToString:@"http://www.douban.com/icon/u1000001.jpg"], @"imageLink");   
  NSString *homePageUrlStr = [[people.homePage URL] absoluteString];
  STAssertTrue([homePageUrlStr isEqualToString:@"http://ahbei.com/"], @"homePage"); 
}


- (void)testDoubanFeedPeople {
  
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedPeople" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  DoubanFeedPeople *feed = [[DoubanFeedPeople alloc] initWithData:data];
    
  STAssertTrue([[feed.title stringValue] isEqualToString:@"搜索 douban 的结果"], @"feed title");

  for (DoubanEntryPeople *people in [feed entries]) {

    if ([people.identifier isEqualToString:@"http://api.douban.com/people/1000000"]) {
      STAssertTrue([[people.title stringValue] isEqualToString:@"六零"], @"title");
      STAssertTrue([[people.uid content] isEqualToString:@"douban"] , @"douban");
      STAssertTrue([people.identifier isEqualToString:@"http://api.douban.com/people/1000000"], @"identifier");  
    }
    
    if ([people.identifier isEqualToString:@"http://api.douban.com/people/1428797"]) {
      STAssertTrue([[people.title stringValue] isEqualToString:@"yangjiani"], @"title");
      STAssertTrue([[people.uid content] isEqualToString:@"www.douban.amy."] , @"uid");
      STAssertTrue([people.identifier isEqualToString:@"http://api.douban.com/people/1428797"], @"identifier");  
      STAssertTrue([[people.content stringValue] length] > 0, @"content");
      
      NSString * imageUrlStr = [[people.iconLink URL] absoluteString]; 
      STAssertTrue([imageUrlStr isEqualToString:@"http://t.douban.com/icon/u1428797-1.jpg"], @"imageLink");   
      NSString *homePageUrlStr = [[people.homePage URL] absoluteString];
      STAssertTrue([homePageUrlStr isEqualToString:@"http://http://blog.sina.com.cn/yangjianiamy"], @"homePage"); 
      
    }

    if ([people.identifier isEqualToString:@"http://api.douban.com/people/1405403"]) {
      STAssertTrue([[people.title stringValue] isEqualToString:@"douban"], @"title");
      STAssertTrue([[people.uid content] isEqualToString:@"perfectlie"] , @"uid");
      STAssertTrue([people.identifier isEqualToString:@"http://api.douban.com/people/1405403"], @"identifier");  

    }
    
  }

}


@end
