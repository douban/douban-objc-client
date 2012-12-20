//
//  DoubanFeedSubject.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-7.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanFeedSubject.h"
#import "DoubanEntrySubject.h"

@implementation DoubanFeedSubject


+ (NSString *)standardFeedKind {
  return @"subjects"; //kGDataCategorySubjectsVolume;
}


- (Class)classForEntries {
  return [DoubanEntrySubject class];
}


+ (NSString *)defaultServiceVersion {
  return kDoubanSubjectsDefaultServiceVersion;
}


@end
