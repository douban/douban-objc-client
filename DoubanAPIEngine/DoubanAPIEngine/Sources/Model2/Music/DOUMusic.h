//
//  DOUMusic.h
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUMusic : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *altTitle;
@property (nonatomic, copy) NSString *rating;

@property (nonatomic, copy) NSString *publisher;

@property (nonatomic, copy) NSString *publishDateStr;
@property (nonatomic, retain) NSDate *publishDate;

@property (nonatomic, copy) NSString *image;

@end
