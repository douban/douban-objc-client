//
//  DOUComment.h
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@class DOUUser;
@interface DOUComment : DOUObject


@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *createTimeStr; 
@property (nonatomic, retain) NSDate *createTime;

@property (nonatomic, retain) DOUUser *author;

@end
