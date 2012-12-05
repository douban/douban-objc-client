//
//  DOUNoteArray.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUNoteArray.h"
#import "DOUNote.h"

@implementation DOUNoteArray

+ (Class)objectClass {
  return [DOUNote class];
}

+ (NSString *)objectName {
  return @"notes";
}


@end
