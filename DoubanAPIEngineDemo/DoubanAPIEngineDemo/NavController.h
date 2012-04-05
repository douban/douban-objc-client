//
//  NavController.h
//  DoubanAPIEngineDemo
//
//  Created by Lin GUO on 3/26/12.
//  Copyright (c) 2012 douban Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavController : UIViewController<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
 @private
  IBOutlet UITableView *tableView_;
}

@property (nonatomic, retain) UITableView *tableView;

@end
