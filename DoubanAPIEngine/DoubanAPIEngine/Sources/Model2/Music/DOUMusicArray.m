//
//  DOUMovieArray.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUMusicArray.h"
#import "DOUMusic.h"

@implementation DOUMusicArray

+ (Class)objectClass {
  return [DOUMusic class];
}

+ (NSString *)objectName {
  return @"musics";
}


@end
