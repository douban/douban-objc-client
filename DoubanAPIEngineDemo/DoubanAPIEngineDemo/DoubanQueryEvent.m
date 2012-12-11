//
//  DOUQueryEvent.m
//  DoubanEvent
//
//  Created by Lin GUO on 11-11-8.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanQueryEvent.h"

@implementation DoubanQueryEvent


+ (id)queryForEventById:(int)eventId {
  NSString *subPath = [NSString stringWithFormat:@"/v2/event/%d", eventId];
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];
  return [query autorelease];
}



@end
