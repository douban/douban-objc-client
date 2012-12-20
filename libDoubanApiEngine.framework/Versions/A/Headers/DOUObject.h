//
//  DOUObject.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DOUObject : NSObject

@property (nonatomic, copy) NSString *string;
@property (nonatomic, retain) NSMutableDictionary *dictionary;


- (id)initWithString:(NSString *)theJsonStr;
- (id)initWithDictionary:(NSDictionary *)theDictionary;

+ (id)objectWithString:(NSString *)theJsonStr;
+ (id)objectWithDictionary:(NSDictionary *)theDictionary;

@end
