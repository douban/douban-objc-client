//
//  DOUOnlineTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUOnline.h"
#import "DOUOnlineArray.h"
#import "DOUUser.h"


@interface DOUOnlineTests : SenTestCase

@end


@implementation DOUOnlineTests

- (void)testOnline {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Online" ofType:@"json"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUOnline *online = [[DOUOnline alloc] initWithString:string];
  STAssertTrue([online.identifier isEqualToString:@"11038343"], @"identifier");
  STAssertTrue([online.alt isEqualToString:@"http://www.douban.com/online/11038343/"], @"alt");
  STAssertNotNil(online.desc, @"desc");
  STAssertTrue([online.title isEqualToString:@"新的截图猜电影，来！"], @"title");
  STAssertTrue([online.createTimeStr isEqualToString:@"2012-02-24 11:49:32"], @"createTime");
  STAssertTrue([online.beginTimeStr isEqualToString:@"2012-02-24 11:00:00"], @"beginTime");
  STAssertTrue([online.endTimeStr isEqualToString:@"2012-05-23 11:00:00"], @"endTime");

  STAssertTrue([online.relatedUrl isEqualToString:@"http://www.douban.com/online/10999361/"], @"relatedUrl");
  STAssertTrue([online.topic isEqualToString:@"新的截图猜电影，来！"], @"topic");
  STAssertTrue(online.cascadeInvite, @"cascadeInvite");
  STAssertTrue([online.groupId isEqualToString:@"0"], @"groupId");
  STAssertTrue([online.albumId isEqualToString:@"65606728"], @"albumId");
  
  STAssertTrue(online.participantCount == 13939, @"participantCount");
  STAssertTrue(online.photoCount == 63562, @"photoCount");
  STAssertTrue(online.likedCount == 2134, @"likedCount");
  STAssertTrue(online.recsCount == 417, @"recsCount");

  STAssertTrue([online.icon isEqualToString:@"http://img1.douban.com/bpic/o590273.jpg"], @"icon");
  STAssertTrue([online.thumb isEqualToString:@"http://img1.douban.com/spic/o590273.jpg"], @"thumb");
  STAssertTrue([online.cover isEqualToString:@"http://img1.douban.com/tpic/o590273.jpg"], @"cover");
  STAssertTrue([online.image isEqualToString:@"http://img1.douban.com/lpic/o590273.jpg"], @"image");

  STAssertNotNil(online.owner, @"owner");
  
  STAssertTrue([online.owner.identifier isEqualToString:@"3121692"], @"owner identifier");
  STAssertTrue([online.owner.avatar isEqualToString:@"http://img3.douban.com/icon/u3121692-33.jpg"], @"owner avatar");
  STAssertTrue([online.owner.alt isEqualToString:@"http://www.douban.com/people/linghowl/"], @"owner alt");
  STAssertTrue([online.owner.name isEqualToString:@"浩叔出没东莫村"], @"owner name");
  STAssertTrue([online.owner.uid isEqualToString:@"linghowl"], @"owner uid");

  STAssertTrue(online.participated == FALSE, @"joined");
  STAssertTrue(online.liked == FALSE, @"liked");
}


- (void)testOnlineArray {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"OnlineArray" ofType:@"json"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUOnlineArray *onlines = [[DOUOnlineArray alloc] initWithString:string];

  STAssertTrue(onlines.count == 3, @"count");
  STAssertTrue(onlines.start == 0, @"start");
  STAssertTrue(onlines.total  == 270, @"total");
  STAssertTrue([onlines.objectArray count]  == 3, @"objectArray");

  for (DOUOnline *online in onlines.objectArray) {
    if ([online.identifier isEqualToString:@"11038343"]) {
      STAssertTrue([online.alt isEqualToString:@"http://www.douban.com/online/11038343/"], @"alt"); 
    }
    
    if ([online.identifier isEqualToString:@"11063385"]) {
      STAssertTrue([online.alt isEqualToString:@"http://www.douban.com/online/11063385/"], @"alt"); 
    }

    if ([online.identifier isEqualToString:@"11063653"]) {
      STAssertTrue([online.alt isEqualToString:@"http://www.douban.com/online/11063653/"], @"alt"); 
    }
  }
  
}

@end
