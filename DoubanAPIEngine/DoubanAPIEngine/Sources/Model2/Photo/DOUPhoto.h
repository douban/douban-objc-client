//
//  DOUPhoto.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DOUObject.h"

@class DOUUser;
@interface DOUPhoto : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *privacy;

@property (nonatomic, copy) NSString *createTimeStr;
@property (nonatomic, retain) NSDate *createTime;

@property (nonatomic, assign) NSInteger recsCount; 
@property (nonatomic, assign) NSInteger likedCount; 
@property (nonatomic, assign) NSInteger commentsCount; 

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger position;
@property (nonatomic, copy) NSString *prevPhoto;
@property (nonatomic, copy) NSString *nextPhoto;

@property (nonatomic, assign) BOOL liked;
@property (nonatomic, retain) DOUUser *author;

@property (nonatomic, assign) NSString *albumId;
@property (nonatomic, assign) NSString *albumTitle;

@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) CGSize coverSize;
@property (nonatomic, assign) CGSize thumbSize;
@property (nonatomic, assign) CGSize iconSize;

@end
