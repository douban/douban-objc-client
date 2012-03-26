//
//  NavController.h
//  DoubanAPIEngineDemo
//
//  Created by Lin GUO on 3/26/12.
//  Copyright (c) 2012 douban.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
 @private
  IBOutlet UITableView *tableView_;

}

@property (nonatomic, retain) UITableView *tableView;

@end
