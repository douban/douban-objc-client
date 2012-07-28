//
//  DOUPeople.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUPeople : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *uid;

@end
