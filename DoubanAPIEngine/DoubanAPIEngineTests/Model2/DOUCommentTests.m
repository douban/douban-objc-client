//
//  DOUCommentTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUComment.h"
#import "DOUCommentArray.h"


@interface DOUCommentTests : SenTestCase

@end


@implementation DOUCommentTests

- (void)testCommentArray {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"CommentArray" ofType:@"json"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUCommentArray *comments = [[DOUCommentArray alloc] initWithString:string];
  
  STAssertTrue(comments.count == 20, @"count");
  STAssertTrue(comments.start == 0, @"start");
  STAssertTrue(comments.total  == 2, @"total");
  STAssertTrue([comments.objectArray count]  == 2, @"objectArray");
  
  for (DOUComment *comment in comments.objectArray) {
    if ([comment.identifier isEqualToString:@"104802214"]) {
      STAssertTrue([comment.content isEqualToString:@"童年呀"], @"content"); 
    }
    
    if ([comment.identifier isEqualToString:@"104802291"]) {
      STAssertTrue([comment.content isEqualToString:@"停产了 我最爱的蜜汁猪排"], @"content"); 
    }

  }
  
}

@end
