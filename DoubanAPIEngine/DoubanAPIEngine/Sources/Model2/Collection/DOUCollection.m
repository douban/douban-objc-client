//
//  DOUCollection.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUCollection.h"

@implementation DOUCollection

@dynamic status;
@dynamic book_id;
@dynamic tags;
@dynamic updated;

- (NSString *)status {
    return [self.dictionary objectForKey:@"status"];
}


- (NSString *)book_id {
    return [self.dictionary objectForKey:@"book_id"];
}

- (NSString *)tags {
    return [self.dictionary objectForKey:@"tags"];
}

- (NSString *)updated {
    return [self.dictionary objectForKey:@"updated"];
}

@end
