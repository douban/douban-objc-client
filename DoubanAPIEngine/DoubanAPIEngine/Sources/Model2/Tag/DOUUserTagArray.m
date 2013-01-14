//
//  DOUUserTagArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUUserTagArray.h"

#import "DOUUserTag.h"

@implementation DOUUserTagArray

+ (Class)objectClass {
    return [DOUUserTag class];
}

+ (NSString *)objectName {
    return @"tags";
}

@end
