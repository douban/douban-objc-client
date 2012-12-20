//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUAPIEngine.h"
#import "DoubanEntryEvent.h"
#import "DoubanFeedEvent.h"
#import "DoubanLocation.h"
#import "DoubanAttribute.h"
#import "GDataWhen.h"
#import "GDataWhere.h"

@interface DoubanEventTests : SenTestCase 

- (void)testDoubanEntryEvent;

- (void)testDoubanFeedEvent;

@end


@implementation DoubanEventTests


- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanEntryEvent {

  NSString *filePath = 
    [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntryEvent" ofType:@"xml"];

  if (filePath) {
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    DoubanEntryEvent *event = [[DoubanEntryEvent alloc] initWithData:data]; 
    
    NSArray *authors = [event authors];
    STAssertNotNil(authors, @"authors");
    STAssertTrue([[[authors objectAtIndex:0] name] isEqualToString:@"小娟山谷里的居民"], @"");
    
    STAssertTrue([[event identifier] isEqualToString:@"http://api.douban.com/event/14792861"], @"latitude");
    STAssertTrue([[[event title] stringValue] isEqualToString:@"山谷里，我的家/小娟山谷里的居民2011北京演唱会"], @"title");
    
    STAssertTrue([[[[event when] startTime] stringValue] isEqualToString:@"2011-12-18T19:30:00+08:00"], @"startTime");
    STAssertTrue([[[[event when] endTime] stringValue] isEqualToString:@"2011-12-18T21:30:00+08:00"], @"endTime");
    STAssertTrue([[[event where] stringValue] isEqualToString:@"北京 西城区 西直门/动物园 北京展览馆剧场"], @"where");
    STAssertTrue([event albumId] == 58416320, @"album");

    STAssertTrue([event participantsCount] == 342, @"participantsCount");
    STAssertTrue([event wishersCount] == 1118, @"wishersCount");
    STAssertTrue([[[event location] identity] isEqualToString:@"beijing"], @"location");
    STAssertTrue(fabs([event geoLatitude] - 39.904213 )< 0.000001, @"latitude");
    STAssertTrue(fabs([event geoLongitude] - 116.40741) < 0.000001, @"longitude");  
    

    
    GDataEntryBase *empty = [GDataEntryBase entry];
    [empty addExtensionDeclarations];
    [empty addExtensionDeclarationForParentClass:[empty class]
                                   childClasses:[DoubanAttribute class],nil];
    
    
    DoubanAttribute *attribute = [[[DoubanAttribute alloc] init] autorelease];
    [attribute setName:@"participate_date"];
    [attribute setContent:@"2011-01-01"];
    
    [empty addObject:attribute forExtensionClass: [DoubanAttribute class]];  
    
    NSData *theData = [[empty XMLDocument] XMLData];
    NSString *string = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
    NSLog(@"result: %@", string);
  }
}


- (void)testDoubanFeedEvent {
  
  NSString *filePath = 
          [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedEvent" ofType:@"xml"];  
  if (filePath) {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    DoubanFeedEvent *feed = [[DoubanFeedEvent alloc] initWithData:data];
    STAssertTrue([[[feed title] stringValue] isEqualToString:@"胖胖的大头鱼的活动"], @"title");
    
    NSArray *events = [feed entries];
    STAssertTrue([events count] == 1, @"events count");
    
    DoubanEntryEvent *event = [events objectAtIndex:0];
    STAssertTrue([[event identifier] isEqualToString:@"http://api.douban.com/event/10297336"], @"latitude");
    STAssertTrue([[[event title] stringValue] isEqualToString:@"Open Source Camp 北京 2008技术交流盛会"], @"title");
    
    STAssertTrue([[[[event when] startTime] stringValue] isEqualToString:@"2008-10-25T13:00:00+08:00"], @"startTime");
    STAssertTrue([[[[event when] endTime] stringValue] isEqualToString:@"2008-10-25T19:00:00+08:00"], @"endTime");
    STAssertTrue([[[event where] stringValue] isEqualToString:@"北京 海淀区蓝旗营路北 工商银行旁 Study 英语学 习吧（三角地）"], @"where");
    STAssertTrue([event albumId] == 0, @"album");
    
    
    STAssertTrue([event participantsCount] == 13, @"participantsCount");
    STAssertTrue([event wishersCount] == 22, @"wishersCount");
    STAssertTrue([[[event location] identity] isEqualToString:@"beijing"], @"location");
    STAssertTrue([event geoLatitude] == 0 , @"latitude");
    STAssertTrue([event geoLongitude] == 0 , @"longitude");
        
    NSMutableArray *mutableEvents = [[NSMutableArray alloc] initWithArray:events];
    [mutableEvents removeObject:event];
    [feed setEntries:mutableEvents];
    STAssertTrue([[feed entries] count] == 0 , @"after remove");
  }
  
  
  
}


@end
