//
//  DOUEvent.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@class DOUUser;
@interface DOUEvent : DOUObject

extern NSString * const kParticipatedStatus;
extern NSString * const kWishedStatus;
extern NSString * const kArrivedStatus;

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *beginTimeStr;
@property (nonatomic, retain) NSDate *beginTime;
@property (nonatomic, copy) NSString *endTimeStr;
@property (nonatomic, retain) NSDate *endTime;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *categoryName;


@property (nonatomic, copy) NSString *adaptUrl;
@property (nonatomic, copy) NSString *locId;
@property (nonatomic, copy) NSString *locName;
@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *albumId;

@property (nonatomic, assign) NSInteger participantCount;
@property (nonatomic, assign) NSInteger wisherCount;

@property (nonatomic, copy) NSString *imageMobile;
@property (nonatomic, copy) NSString *imageLarge;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *icon;

@property (nonatomic, retain) DOUUser *owner;

@property (nonatomic, copy) NSString    *participateDateStr;
@property (nonatomic, retain) NSDate    *participateDate;
@property (nonatomic, copy)   NSString  *status;

@property (nonatomic, assign) float lat;
@property (nonatomic, assign) float lng;

@end
