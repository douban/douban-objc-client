//
//  GDataAtomAuthor+Extension.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataBaseElements.h"


@class GDataLink;
@interface GDataAtomAuthor (Extension)

- (GDataLink *)linkWithRelAttributeValue:(NSString *)rel;

@end
