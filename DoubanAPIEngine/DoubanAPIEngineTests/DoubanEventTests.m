//
//  DOUAPIEngineTests.m
//  DOUAPIEngineTests
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DoubanEntryEvent.h"
#import "DoubanFeedEvent.h"


@interface DoubanEventTests : SenTestCase 
- (void)testDoubanEntryEvent;
- (void)testDoubanFeedEvent;

@end


@implementation DoubanEventTests

- (void)setUp {
  [super setUp];
  // Set-up code here.
}

- (void)tearDown {
  // Tear-down code here.
  [super tearDown];
}



- (void)testDoubanEntryEvent {

  NSString *filePath = 
    [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanEntryEvent" ofType:@"xml"];


  if (filePath) {
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    DoubanEntryEvent *event = [[DoubanEntryEvent alloc] initWithData:data]; 
    NSLog(@"event id:%@", [event identifier]);                               
    NSLog(@"event title:%@", [[event title] stringValue]);                               
    NSLog(@"event when:%@", [[event when] value]);                       
    NSLog(@"event where:%@", [[event where] stringValue]);
    NSLog(@"event summary:%@", [[event summary] stringValue]);
    NSLog(@"event content:%@", [[event content] stringValue]);
    NSLog(@"event participants:%d", [event participants]);  
    NSLog(@"event location:%@", [[event location] identity]);
    
    for (DoubanAttribute* attribute in [event attributes]) {
      NSLog(@"attribute %@:%@", [attribute name], [attribute content]);
    }
  }
}

- (void)testDoubanFeedEvent {
  
  NSString *filePath = 
          [[NSBundle bundleForClass:[self class]] pathForResource:@"DoubanFeedEvent" ofType:@"xml"];  
  if (filePath) {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    DoubanFeedEvent *feed = [[DoubanFeedEvent alloc] initWithData:data];
    
    for (DoubanEntryEvent *event in [feed entries]) {
      NSLog(@"event id:%@", [event identifier]);                               
      NSLog(@"event title:%@", [[event title] stringValue]);                               
      NSLog(@"event when:%@", [[event when] value]);                       
      NSLog(@"event where:%@", [[event where] stringValue]);
      NSLog(@"event summary:%@", [[event summary] stringValue]);
      NSLog(@"event content:%@", [[event content] stringValue]);
      NSLog(@"event participants:%d", [event participants]);  
      NSLog(@"event location:%@", [[event location] identity]);
      
      for (DoubanAttribute* attribute in [event attributes]) {
        NSLog(@"attribute %@:%@", [attribute name], [attribute content]);
      }
    }
  }


}




@end
