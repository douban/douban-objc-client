//
//  DoubanUID.h
//  douban-objective-c
//
//  Created by py on 3/23/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "GDataExtendedProperty.h"

@interface DoubanUID : GDataExtendedProperty <GDataExtension>

- (NSString *)content;

- (void)setContent:(NSString *)str;

@end
