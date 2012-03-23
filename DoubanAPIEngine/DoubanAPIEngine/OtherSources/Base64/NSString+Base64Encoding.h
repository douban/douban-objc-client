//
//  NSString+NSStringAddtions.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 3/23/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/NSString.h>

@interface NSString(Base64Encoding)

+ (NSString *) base64StringFromData:(NSData *)data length:(int)length;

@end
