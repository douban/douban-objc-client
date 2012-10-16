//
//  DOULoc.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 9/7/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOULoc : DOUObject

@property (nonatomic, copy) NSString  *identifier;
@property (nonatomic, copy) NSString  *parent;
@property (nonatomic, copy) NSString  *name;
@property (nonatomic, copy) NSString  *uid;
@property (nonatomic, assign) BOOL  isHabitable;

@end
