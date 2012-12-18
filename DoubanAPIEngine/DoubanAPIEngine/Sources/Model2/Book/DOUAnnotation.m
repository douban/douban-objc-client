//
//  DOUAnnotation.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUAnnotation.h"

@implementation DOUAnnotation

@dynamic chapter;
@dynamic book_id;
@dynamic time;
@dynamic content;

- (NSString *)chapter {
    return [self.dictionary objectForKey:@"count"];
}


- (NSString *)book_id {
    return [self.dictionary objectForKey:@"name"];
}

- (NSString *)time {
    return [self.dictionary objectForKey:@"count"];
}


- (NSString *)content {
    return [self.dictionary objectForKey:@"name"];
}

@end
