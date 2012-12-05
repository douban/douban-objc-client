//
//  DOUMovie.h
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUMovie : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *originalTitle;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *stars;

@property (nonatomic, copy) NSString *publishTimeStr;
@property (nonatomic, retain) NSDate *publishTime;

@property (nonatomic, copy) NSString *largeImage;
@property (nonatomic, copy) NSString *smallImage;
@property (nonatomic, copy) NSString *mediumImage;

@property (nonatomic, assign) NSInteger wishCount;
@property (nonatomic, assign) NSInteger collectionCount;


@end
