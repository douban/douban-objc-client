//
//  DOUOnline.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@class DOUUser;
@interface DOUOnline : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, retain) NSArray *tags;

@property (nonatomic, copy) NSString *createTimeStr;
@property (nonatomic, retain) NSDate *createTime;
@property (nonatomic, copy) NSString *beginTimeStr;
@property (nonatomic, retain) NSDate *beginTime;
@property (nonatomic, copy) NSString *endTimeStr;
@property (nonatomic, retain) NSDate *endTime;


@property (nonatomic, copy) NSString *relatedUrl;
@property (nonatomic, copy) NSString *topic;

@property (nonatomic, assign) BOOL cascadeInvite;

@property (nonatomic, copy) NSString *groupId;
@property (nonatomic, copy) NSString *albumId;

@property (nonatomic, assign) NSInteger participantCount;
@property (nonatomic, assign) NSInteger photoCount;
@property (nonatomic, assign) NSInteger likedCount;
@property (nonatomic, assign) NSInteger recsCount;

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, retain) DOUUser *owner;

@property (nonatomic, assign) BOOL liked;
@property (nonatomic, assign) BOOL participated;

@end
