//
//  DOUAlbum.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@class DOUUser;
@interface DOUAlbum : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *privacy;

@property (nonatomic, copy) NSString *createTimeStr;
@property (nonatomic, retain) NSDate *createTime;
@property (nonatomic, copy) NSString *updateTimeStr;
@property (nonatomic, retain) NSDate *updateTime;

@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) NSInteger recsCount;
@property (nonatomic, assign) NSInteger likedCount;

@property (nonatomic, assign) BOOL liked;

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *image;

@property (nonatomic, retain) DOUUser *author;

@end
