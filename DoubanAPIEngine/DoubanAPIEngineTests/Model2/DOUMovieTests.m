//
//  DOUCommentTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUMovie.h"
#import "DOUMovieArray.h"
#import "DOUObject+Utils.h"

@interface DOUMovieTests : SenTestCase

@end


@implementation DOUMovieTests

- (void)testMovieArray {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"MovieArray" ofType:@"json"];
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUMovieArray *movies = [[DOUMovieArray alloc] initWithString:string];
  
  STAssertTrue(movies.count == 20, @"count");
  STAssertTrue(movies.start == 0, @"start");
  STAssertTrue(movies.total  == 1, @"total");
  STAssertTrue([movies.objectArray count]  == 1, @"objectArray");
  
  for (DOUMovie *movie in movies.objectArray) {
    if ([movie.identifier isEqualToString:@"20280228"]) {
      STAssertTrue([movie.title isEqualToString:@"我们可以结婚吗"], @"title");
      STAssertTrue([movie.originalTitle isEqualToString:@"우리가 결혼할 수 있을까"], @"title");
      STAssertTrue([movie.rating isEqualToString:@"8.4"], @"rating");
      STAssertTrue([movie.stars isEqualToString:@"45"], @"stars");
      STAssertTrue([movie.publishTimeStr isEqualToString:@"2012-10-29"], @"publishdata");
      NSLog(@"*****%@", movie.publishTime);
      STAssertTrue([movie.publishTime isEqualToDate: [[movie class] dateOfString:@"2012-10-29" dateFormat:@"yyyy-MM-dd"]], @"publishdata");
      STAssertTrue(movie.wishCount == 400, @"wish");
      STAssertTrue(movie.collectionCount == 117, @"collection");
    }
  }
  
}

@end
