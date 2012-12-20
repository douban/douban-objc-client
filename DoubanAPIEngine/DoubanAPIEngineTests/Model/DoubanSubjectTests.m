//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DoubanEntrySubject.h"
#import "DoubanFeedSubject.h"
#import "GDataBaseElements.h"
#import "GDataRating.h"
#import "DoubanAttribute.h"
#import "DoubanTag.h"


@interface DoubanSubjectTests : SenTestCase 

- (void)testDoubanEntrySubject;

- (void)testDoubanFeedSubject;

@end


@implementation DoubanSubjectTests


- (void)setUp {
  [super setUp];
}


- (void)tearDown {
  [super tearDown];
}


- (void)testDoubanEntrySubject {

  NSString *filePath = 
            [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntrySubject" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"filePath fail!");
    
  NSData *data = [NSData dataWithContentsOfFile:filePath];
    
  DoubanEntrySubject *subject = [[DoubanEntrySubject alloc] initWithData:data]; 
  
  STAssertTrue([[subject tags] count] == 5, @"tags ");
  
  for (id tagObject in [subject tags]) {

    DoubanTag *tag = (DoubanTag*)tagObject;
    if ([[tag name] isEqualToString:@"片山恭一"])
       STAssertTrue([[tag count] integerValue] == 15, @"name");

    if ([[tag name] isEqualToString:@"小说"])
      STAssertTrue([[tag count] integerValue]== 6, @"name");  
    
    if ([[tag name] isEqualToString:@"日本小说"])
      STAssertTrue([[tag count] integerValue]== 5, @"name");  
    
    if ([[tag name] isEqualToString:@"日本文学"])
      STAssertTrue([[tag count] integerValue]== 2, @"name");  

    if ([[tag name] isEqualToString:@"日本"])
      STAssertTrue([[tag count] integerValue]== 2, @"name"); 
  }
  
  STAssertTrue([[subject identifier] isEqualToString:@"http://api.douban.com/book/subject/2023013"], @"identifier");
  STAssertTrue([[[subject title] stringValue] isEqualToString:@"倘若我在彼岸-日本畅销爱情小说"], @"title");
  STAssertTrue([[[subject summary] stringValue] length] > 0, @"summary");

  STAssertTrue([[subject authors] count] == 1, @"authors");
  for (GDataAtomAuthor *author in [subject authors]){
    STAssertTrue([[author name] isEqualToString:@"片山恭一"], @"author");
  }
    
  for (DoubanAttribute* attribute in [subject attributes]) {
    if ([[attribute name] isEqualToString:@"isbn10"]) {
      STAssertTrue([[attribute content] isEqualToString:@"7543639130"], @"attribute");
    }
    if ([[attribute name] isEqualToString:@"isbn13"]) {
      STAssertTrue([[attribute content] isEqualToString:@"9787543639133"], @"attribute");
    }
    if ([[attribute name] isEqualToString:@"pages"]) {
      STAssertTrue([[attribute content] isEqualToString:@"193"], @"attribute");
    }
    if ([[attribute name] isEqualToString:@"tranlator"]) {
      STAssertTrue([[attribute content] isEqualToString:@"张兴"], @"attribute");
    }
    if ([[attribute name] isEqualToString:@"price"]) {
      STAssertTrue([[attribute content] isEqualToString:@"14"], @"attribute");
    }
    if ([[attribute name] isEqualToString:@"author"]) {
      STAssertTrue([[attribute content] isEqualToString:@"片山恭一"], @"attribute");
    }
    if ([[attribute name] isEqualToString:@"publisher"]) {
      STAssertTrue([[attribute content] isEqualToString:@"青岛出版社"], @"attribute");
    }
    if ([[attribute name] isEqualToString:@"author-intro"]) {
      STAssertTrue([[attribute content] length] > 0, @"authors-intro");      
    }
  }

  STAssertTrue([[subject.rating average] floatValue]== 4.00, @"rating average");
  STAssertTrue([[subject.rating max] integerValue] == 5, @"rating average");
  STAssertTrue([[subject.rating min] integerValue] == 1, @"rating average");
  STAssertTrue([[subject.rating numberOfRaters] integerValue] == 12, @"rating average");
}



- (void)testDoubanFeedSubject {
  
  NSString *filePath = 
          [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedSubject" ofType:@"xml"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  DoubanFeedSubject *feed = [[DoubanFeedSubject alloc] initWithData:data];
    
  STAssertTrue([[[feed title] stringValue] isEqualToString:@"带有标签 cowboy 的条目"], @"feed title");
    
  for (DoubanFeedSubject *subject in [feed entries]) {

    
    
    if ([[subject identifier] isEqualToString:@"http://api.douban.com/subject/subject/1424406"]) {
      STAssertTrue([[[subject title] stringValue] isEqualToString:@"Cowboy Bebop"], @"title");
      
      STAssertTrue([[subject authors] count] == 1, @"authors");
      for (GDataAtomAuthor *author in [subject authors]){
        STAssertTrue([[author name] isEqualToString:@"渡边信一郎"], @"author");
      }
      
      for (DoubanAttribute* attribute in [subject attributes]) {
        if ([[attribute name] isEqualToString:@"site"]) {
          STAssertTrue([[attribute content] isEqualToString:@"http://www.cowboybebop.org/"], @"site");
        }
        if ([[attribute name] isEqualToString:@"year"]) {
          STAssertTrue([[attribute content] isEqualToString:@"1998"], @"year");
        }
        if ([[attribute name] isEqualToString:@"language"]) {
          STAssertTrue([[attribute content] isEqualToString:@"日语"], @"language");
        }
        if ([[attribute name] isEqualToString:@"imdb"]) {
          STAssertTrue([[attribute content] isEqualToString:@"http://www.imdb.com/title/tt0213338/"], @"imdb");
        }
        if ([[attribute name] isEqualToString:@"country"]) {
          STAssertTrue([[attribute content] isEqualToString:@"Japan"], @"imdb");
        }
        
      }
    }
    
    
    if ([[subject identifier] isEqualToString:@"http://api.douban.com/subject/subject/1307031"]) {
      STAssertTrue([[[subject title] stringValue] isEqualToString:@"Cowboy Bebop: Knockin' on Heaven's Door"], @"title");
      
      STAssertTrue([[subject authors] count] == 1, @"authors");
      for (GDataAtomAuthor *author in [subject authors]){
        STAssertTrue([[author name] isEqualToString:@"渡边信一郎 (Shinichirô Watanabe)"], @"author");
      }
      
      for (DoubanAttribute* attribute in [subject attributes]) {
        if ([[attribute name] isEqualToString:@"site"]) {
          STAssertTrue([[attribute content] isEqualToString:@"http://www.sonypictures.com/cthe/cowboybebop/"], @"site");
        }
        if ([[attribute name] isEqualToString:@"year"]) {
          STAssertTrue([[attribute content] isEqualToString:@"2001"], @"year");
        }
        if ([[attribute name] isEqualToString:@"language"]) {
          STAssertTrue([[attribute content] isEqualToString:@"Japanese"], @"language");
        }
        if ([[attribute name] isEqualToString:@"imdb"]) {
          STAssertTrue([[attribute content] isEqualToString:@"http://www.imdb.com/title/tt0275277/"], @"imdb");
        }
        if ([[attribute name] isEqualToString:@"country"]) {
          STAssertTrue([[attribute content] isEqualToString:@"Japan"], @"imdb");
        }
        
      }
    }

  }

}


@end
