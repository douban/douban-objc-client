//
//  MainViewController.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "GetEventController.h"

#import "DOUAPIEngine.h"
#import "DOUEvent.h"
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
  titleLabel_.text = [self.event title];
  timeLabel_.text = [self.event beginTimeStr];
  whereLabel_.text = [self.event address];
  contentLabel_.text = [self.event content];
}


- (IBAction)showInfo:(id)sender {
  DOUService *service = [DOUService sharedInstance];
  service.apiBaseUrlString = kHttpApiBaseUrl;
  
  DOUQuery *query = [DoubanQueryEvent queryForEventById:14910931];

  DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
    NSLog(@"str:%@", [req responseString]);
    NSError *error = [req doubanError];
    if (!error) {
      
      DOUEvent *newEvent = [[DOUEvent alloc] initWithString:[req responseString]];
      self.event = newEvent;
      [newEvent release];
      [self updateUI];
    }    
  };
  
  [service get:query callback:completionBlock];
}




@end
