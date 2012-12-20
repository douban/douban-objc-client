//
//  DOUCommentTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUBook.h"
#import "DOUBookArray.h"
#import "DOUObject+Utils.h"

@interface DOUBookTests : SenTestCase

@end


@implementation DOUBookTests

- (void)testBookArray {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"BookArray" ofType:@"json"];
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUBookArray *books = [[DOUBookArray alloc] initWithString:string];
  
  STAssertTrue(books.count == 20, @"count");
  STAssertTrue(books.start == 0, @"start");
  STAssertTrue(books.total  == 3, @"total");
  STAssertTrue([books.objectArray count]  == 3, @"objectArray");
  
  for (DOUBook *book in books.objectArray) {
    
    if ([book.identifier isEqualToString:@"10757942"]) {
      STAssertTrue([book.title isEqualToString:@"怨女"], @"title");
      STAssertTrue([book.subTitle isEqualToString:@"张爱玲全集03——小说"], @"subtitle");
      STAssertTrue([book.ISBN10 isEqualToString:@"7530211188"], @"isbn10");
      STAssertTrue([book.ISBN13 isEqualToString:@"9787530211182"], @"isbn13");
      STAssertTrue([book.publishDateStr isEqualToString:@"2012-6"], @"publishdata");
      STAssertTrue([book.publishDate isEqualToDate: [[book class] dateOfString:@"2012-6" dateFormat:@"yyyy-MM"]], @"pubdate");
    }
  }
  
}

@end
