//
//  DoubanTag.h
//  douban-objective-c
//
//  Created by py on 3/18/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "GDataExtendedProperty.h"

@interface DoubanTag : GDataExtendedProperty <GDataExtension>

- (NSString *)name;

- (void)setName:(NSString *)str;

- (NSNumber *)count;

- (void)setCount:(NSNumber *)num;

@end
