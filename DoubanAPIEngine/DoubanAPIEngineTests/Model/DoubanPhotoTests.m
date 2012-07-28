//
//  DoubanPhotoTests.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GDataBaseElements.h"

#import "DoubanEntryPhoto.h"
#import "DoubanFeedPhoto.h"


@interface DoubanPhotoTests : SenTestCase 

- (void)testDoubanEntryPhoto;

- (void)testDoubanFeedPhoto;

@end


@implementation DoubanPhotoTests


- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanEntryPhoto {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntryPhoto" 
                                                                        ofType:@"xml"];  
  
  if (!filePath)
    STAssertTrue(FALSE, @"filePath fail!");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  DoubanEntryPhoto *photo =  [[DoubanEntryPhoto alloc] initWithData:data];
  STAssertTrue([[photo.title stringValue] isEqualToString:@"照片"]  , @"title");
  STAssertTrue([photo.identifier isEqualToString:@"http://api.douban.com/photo/1259201045"], @"identifier");
  STAssertTrue([[photo.publishedDate stringValue] isEqualToString:@"2011-10-17T11:55:31+08:00"], @"published");
  STAssertTrue([photo.author.name isEqualToString:@"公路"], @"author");

  STAssertTrue(photo.commentsCount == 12, @"comment count");
  STAssertTrue(photo.recsCount == 1, @"recs count");
  STAssertTrue(photo.position == 20, @"position");

  STAssertTrue(photo.nextPhotoId == 1259196350, @"nextPhotoId");  
  STAssertTrue(photo.prevPhotoId == 1259193512, @"prevPhotoId");
  STAssertTrue(photo.albumId == 58416320, @"albumId");
  STAssertTrue([photo.albumTitle isEqualToString:@"活动照片"], @"album Title");  

}


- (void)testDoubanFeedPhoto {
  
}


@end