//
//  DOUObjectArray.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUObjectArray : DOUObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger total;

@property (nonatomic, retain, readonly) NSArray  *objectArray;

+ (Class)objectClass;
+ (NSString *)objectName;

@end
