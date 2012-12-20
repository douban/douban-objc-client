//
//  DOUMovieArray.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUMovieArray.h"
#import "DOUMovie.h"

@implementation DOUMovieArray

+ (Class)objectClass {
  return [DOUMovie class];
}

+ (NSString *)objectName {
  return @"movies";
}


@end
