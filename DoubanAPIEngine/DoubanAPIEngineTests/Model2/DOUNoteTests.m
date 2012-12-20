//
//  DOUCommentTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUNote.h"


@interface DOUNoteTests : SenTestCase

@end


@implementation DOUNoteTests

- (void)testNote {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Note"
                                                                        ofType:@"json"];
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath
                                               encoding:NSUTF8StringEncoding error:nil];
  DOUNote *note = [[DOUNote alloc] initWithString:string];
  STAssertTrue(note.recsCount == 10, @"resCount");
  STAssertTrue(note.commentsCount == 3, @"commentsCount");
  STAssertTrue(note.likedCount  == 17, @"likeCound");
  STAssertTrue([note.privacy isEqualToString:@"public"], @"privacy");
  STAssertTrue([note.title isEqualToString:@"冯象译经源流考（停止更新）"], @"title");
  STAssertTrue([note.identifier isEqualToString:@"244600047"], @"identifier");
  STAssertTrue([note.alt isEqualToString:@"http://www.douban.com/note/244600047/"], @"alt");
  STAssertTrue([note.summary isEqualToString:@"目前豆瓣已经有了关于冯译的相关小站，站长在把《源流考》的旧文搬进去。加之近来..."], @"summary");

}

@end
