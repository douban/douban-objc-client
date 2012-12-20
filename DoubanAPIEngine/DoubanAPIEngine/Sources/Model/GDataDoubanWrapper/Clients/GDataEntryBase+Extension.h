//
// GDataEntryBase+Extension.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/16/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataEntryBase.h"

@class DoubanAttribute;
@class GDataAtomAuthor;
@interface GDataEntryBase (Extension)

- (NSArray *)doubanAttributes;

- (DoubanAttribute *)attributeForName:(NSString *)attributeName;

- (GDataAtomAuthor *)theFirstAuthor;

@end
