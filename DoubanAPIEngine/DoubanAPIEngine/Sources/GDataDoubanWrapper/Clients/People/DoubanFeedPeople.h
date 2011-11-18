//
//  DoubanFeedPeople.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-15.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataFeedBase.h"

@interface DoubanFeedPeople : GDataFeedBase

+ (DoubanFeedPeople *)peopleFeed;

@end
