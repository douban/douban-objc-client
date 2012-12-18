//
//  DOUUserTag.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUUserTag.h"

@implementation DOUUserTag

@dynamic count;
@dynamic title;

- (NSString *)count {
    return [self.dictionary objectForKey:@"count"];
}


- (NSString *)name {
    return [self.dictionary objectForKey:@"title"];
}

@end
