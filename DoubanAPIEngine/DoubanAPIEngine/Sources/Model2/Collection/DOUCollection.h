//
//  DOUCollection.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"

@interface DOUCollection : DOUObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *book_id;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *updated;

@end
