//
//  DOUCommentTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUMusic.h"
#import "DOUMusicArray.h"
#import "DOUObject+Utils.h"

@interface DOUMusicTests : SenTestCase

@end


@implementation DOUMusicTests

- (void)testMusicArray {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"MusicArray" ofType:@"json"];
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUMusicArray *musics = [[DOUMusicArray alloc] initWithString:string];
  STAssertTrue(musics.count == 1, @"count");
  STAssertTrue(musics.start == 0, @"start");
  STAssertTrue(musics.total  == 1, @"total");
  STAssertTrue([musics.objectArray count]  == 1, @"objectArray");
  
  for (DOUMusic *music in musics.objectArray) {
    if ([music.identifier isEqualToString:@"20275660"]) {
      STAssertTrue([music.title isEqualToString:@"花又開好了 (生命的美好平裝發行版)"], @"title");
      STAssertTrue([music.rating isEqualToString:@"7.4"], @"rating");
      STAssertTrue([music.publisher isEqualToString:@"華研唱片"], @"publisher");
      STAssertTrue([music.publishDateStr isEqualToString:@"2012-11-16"], @"pubdata");
      STAssertTrue([music.publishDate isEqualToDate: [[music class] dateOfString:@"2012-11-16" dateFormat:@"yyyy-MM-dd"]], @"pubdata");

    }
  }
  
}

@end
