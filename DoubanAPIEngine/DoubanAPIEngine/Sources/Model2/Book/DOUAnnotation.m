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
@dynamic abstract;

- (NSString *)chapter {
    return [self.dictionary objectForKey:@"chapter"];
}


- (NSString *)book_id {
    return [self.dictionary objectForKey:@"book_id"];
}

- (NSString *)time {
    return [self.dictionary objectForKey:@"time"];
}


- (NSString *)abstract {
    return [self.dictionary objectForKey:@"abstract"];
}

@end
