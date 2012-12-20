//
//  DOUAlbumArray.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUAlbumArray.h"
#import "DOUAlbum.h"

@implementation DOUAlbumArray

+ (Class)objectClass {
  return [DOUAlbum class];
}

+ (NSString *)objectName {
  return @"albums";
}

@end
