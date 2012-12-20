//
//  GeorssPoint.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "GDataExtendedProperty.h"

@interface GeorssPoint : GDataExtendedProperty <GDataExtension>

- (NSString *)content;

- (void)setContent:(NSString *)str;

- (float) geoLatitude;

- (float) geoLongitude;

@end
