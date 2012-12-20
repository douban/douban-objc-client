//
//  DOUNotification.h
//  DoubanAPIEngine
//
//  Created by alex zou on 12-11-6.
//  Copyright (c) 2012年 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUNotification : DOUObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *containerTitle;
@property (nonatomic, copy) NSString *containerId;
@property (nonatomic, copy) NSString *targetId;
@property (nonatomic, copy) NSString *targetType;
@property (nonatomic, copy) NSString *targetTitle;
@property (nonatomic, copy) NSString *targetIcon;

@property (nonatomic, copy) NSString *timeStr;
@property (nonatomic, copy) NSDate *time;

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *cate;

@end
