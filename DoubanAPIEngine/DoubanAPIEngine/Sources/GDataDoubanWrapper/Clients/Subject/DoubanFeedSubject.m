//
//  DoubanFeedSubject.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-7.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//


#define DOUBANSUBJECT_DEFINE_GLOBALS 1

#import "DoubanFeedSubject.h"
#import "DoubanEntrySubject.h"

@implementation DoubanFeedSubject

+ (DoubanFeedSubject *)subjectFeed {
  
  DoubanFeedSubject *feed = [[[self alloc] init] autorelease];
  
  [feed setNamespaces:[DoubanEntrySubject subjectsNamespaces]];
  
  return feed;
}

+ (NSString *)standardFeedKind {
  return @"akka"; //kGDataCategorySubjectsVolume;
}

+ (void)load {
  [self registerFeedClass];
}

- (Class)classForEntries {
  return [DoubanEntrySubject class];
}

+ (NSString *)defaultServiceVersion {
  return kDoubanSubjectsDefaultServiceVersion;
}

@end
