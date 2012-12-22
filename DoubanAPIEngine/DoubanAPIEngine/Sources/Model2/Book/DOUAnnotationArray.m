//
//  DOUAnnotationArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUAnnotationArray.h"

#import "DOUAnnotation.h"

@implementation DOUAnnotationArray

+ (Class)objectClass {
    return [DOUAnnotation class];
}

+ (NSString *)objectName {
    return @"annotations";
}

@end
