//
//  DOUTagArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUTagArray.h"

#import "DOUTag.h"

@implementation DOUTagArray

+ (Class)objectClass {
    return [DOUTag class];
}

+ (NSString *)objectName {
    return @"tags";
}

@end
