//
//  DOUQueryEvent.h
//  DoubanEvent
//
//  Created by Lin GUO on 11-11-8.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUAPIEngine.h"


@interface DoubanQueryEvent : DOUQuery

+ (id)queryForEventById:(int)eventId;

@end
