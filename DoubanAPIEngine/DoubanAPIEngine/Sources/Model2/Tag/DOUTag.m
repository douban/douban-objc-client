//
//  DOUTag.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUTag.h"

@implementation DOUTag

@dynamic count;
@dynamic name;

- (NSString *)count {
    return [self.dictionary objectForKey:@"count"];
}


- (NSString *)name {
    return [self.dictionary objectForKey:@"name"];
}

@end
