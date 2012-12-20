//
//  DOUNote.h
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUNote : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, retain) NSArray *content;
@property (nonatomic, copy) NSString *privacy;

@property (nonatomic, assign) BOOL    canReply;

@property (nonatomic, copy) NSString *updateTimeStr;
@property (nonatomic, retain) NSDate *updateTime;
@property (nonatomic, copy) NSString *publishTimeStr;
@property (nonatomic, retain) NSDate *publishTime;

@property (nonatomic, assign) NSInteger recsCount;
@property (nonatomic, assign) NSInteger likedCount;
@property (nonatomic, assign) NSInteger commentsCount;

@end
