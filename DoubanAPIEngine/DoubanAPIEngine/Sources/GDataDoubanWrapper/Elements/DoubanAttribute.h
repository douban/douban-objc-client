//
//  DoubanAttribute.h
//  douban-objective-c
//
//  Created by py on 3/18/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//
#import "GDataExtendedProperty.h"

@interface DoubanAttribute : GDataExtendedProperty <GDataExtension>

- (NSString *)content;

- (void)setContent:(NSString *)str;

@end
