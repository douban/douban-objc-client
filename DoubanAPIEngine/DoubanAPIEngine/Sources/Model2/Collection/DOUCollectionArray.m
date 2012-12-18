//
//  DOUCollectionArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUCollectionArray.h"

#import "DOUCollection.h"

@implementation DOUCollectionArray

+ (Class)objectClass {
    return [DOUCollection class];
}

+ (NSString *)objectName {
    return @"collections";
}

@end
