//
//  GetEventController.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//


@class DOUEvent;
@interface GetEventController : UIViewController {
 @private
  DOUEvent *event_;

  IBOutlet UILabel *titleLabel_;
  IBOutlet UILabel *timeLabel_;
  IBOutlet UILabel *whereLabel_;
  IBOutlet UILabel *contentLabel_;

}

@property (nonatomic, retain) DOUEvent *event;

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *timeLabel;
@property (nonatomic, retain) UILabel *whereLabel;
@property (nonatomic, retain) UILabel *contentLabel;

- (IBAction)showInfo:(id)sender;

- (void)updateUI;
@end
