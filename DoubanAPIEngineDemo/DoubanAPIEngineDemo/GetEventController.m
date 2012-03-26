//
//  MainViewController.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "GetEventController.h"

#import "DOUAPIEngine.h"
#import "DoubanEntryEvent.h"
#import "DoubanQueryEvent.h"

@implementation GetEventController

@synthesize event = event_;
@synthesize titleLabel = titleLabel_;
@synthesize timeLabel  = timeLabel_;
@synthesize whereLabel = whereLabel_;
@synthesize contentLabel = contentLabel_;


#pragma mark - View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"Get 活动信息";
  }
  return self;
}


- (void)dealloc {
  [event_ release]; event_ = nil;
  [timeLabel_ release]; timeLabel_ = nil;
  [whereLabel_ release]; whereLabel_ = nil;
  [contentLabel_ release]; contentLabel_ = nil;
  [super dealloc];
}


- (void)viewDidUnload {
  [super viewDidUnload];
  self.event = nil;
  self.titleLabel = nil;
  self.timeLabel = nil;
  self.whereLabel = nil;
  self.contentLabel = nil;
}


- (void)updateUI {
  titleLabel_.text = [[self.event title] stringValue];
  timeLabel_.text = [[self.event when] stringValueForAttribute:@"endTime"];
  whereLabel_.text = [[self.event where] stringValue];
  contentLabel_.text = [[self.event content] stringValue];
}


- (IBAction)showInfo:(id)sender {
  DOUService *service = [DOUService sharedInstance];
  DOUQuery *query = [DoubanQueryEvent queryForEventById:14910931];

  DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
    NSError *error = [req error];
    NSLog(@"str:%@", [req responseString]);
    
    if (!error) {
      
      DoubanEntryEvent *newEvent = [[DoubanEntryEvent alloc] initWithData:[req responseData]];
      self.event = newEvent;
      [newEvent release];
      [self updateUI];
    }    
  };
  
  [service get:query callback:completionBlock];
}




@end
