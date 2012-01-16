//
//  MainViewController.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "MainViewController.h"

#import "DOUAPIEngine.h"
#import "DoubanEntryEvent.h"
#import "DoubanQueryEvent.h"

@implementation MainViewController

@synthesize event = event_;
@synthesize titleLabel = titleLabel_;
@synthesize timeLabel  = timeLabel_;
@synthesize whereLabel = whereLabel_;
@synthesize contentLabel = contentLabel_;


#pragma mark - View lifecycle

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

  __block DOUHttpRequest *req 
      = [DOUHttpRequest requestWithQuery:query 
                         completionBlock:^{
                            NSError *error = [req error];
                            if (!error) {
                              NSLog(@"str:%@", [req responseString]);
                                   
                              DoubanEntryEvent *newEvent = [[DoubanEntryEvent alloc] initWithData:[req responseData]];
                              self.event = newEvent;
                              [newEvent release];
                              [self updateUI];
                            }    
                        }];
  [service addRequest:req];
}




@end
