//
//  DOUAnnotation.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"

@interface DOUAnnotation : DOUObject

@property (nonatomic, copy) NSString *chapter;
@property (nonatomic, copy) NSString *book_id;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *abstract;

@end
