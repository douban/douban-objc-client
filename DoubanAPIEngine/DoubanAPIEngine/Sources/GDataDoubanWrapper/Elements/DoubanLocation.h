//
//  DoubanLocation.h
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GDataExtendedProperty.h"

@interface DoubanLocation : GDataExtendedProperty <GDataExtension>

- (NSString *)identity;

- (void)setIdentity:(NSString *)str;

- (NSString *)content;

- (void)setContent:(NSString *)str;

@end

