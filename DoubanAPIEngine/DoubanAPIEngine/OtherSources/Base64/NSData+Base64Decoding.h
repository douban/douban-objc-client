//
//  NSData+NSData_Base64Decoding.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 3/23/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64Decoding)

+ (NSData *) base64DataFromString:(NSString *)string;

@end
