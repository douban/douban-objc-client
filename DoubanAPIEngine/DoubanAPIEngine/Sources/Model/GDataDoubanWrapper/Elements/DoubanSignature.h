//
//  DoubanSignature.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-15.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataExtendedProperty.h"

@interface DoubanSignature : GDataExtendedProperty <GDataExtension>

- (NSString *)content;
- (void)setContent:(NSString *)str;

@end
