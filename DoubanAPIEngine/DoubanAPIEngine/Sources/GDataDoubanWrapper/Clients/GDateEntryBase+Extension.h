//
// GDateEntryBase+Extension.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/16/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataEntryBase.h"
#import "GDataBaseElements.h"

@class DoubanAttribute;
@interface GDataEntryBase (Extension)

- (DoubanAttribute *)attributeForName:(NSString *)attributeName;
- (GDataAtomAuthor *)author;

@end
