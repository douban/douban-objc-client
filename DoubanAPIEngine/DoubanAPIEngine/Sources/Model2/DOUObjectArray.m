//
//  DOUObjectArray.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObjectArray.h"

@implementation DOUObjectArray

@dynamic start;
@dynamic count;
@dynamic total;
@dynamic objectArray;


- (NSInteger)start {
  return [[self.dictionary objectForKey:@"start"] integerValue];
}


- (NSInteger)count {
  return [[self.dictionary objectForKey:@"count"] integerValue];
}


- (NSInteger)total {
  return [[self.dictionary objectForKey:@"total"] integerValue];
}


- (NSArray*)objectArray {
  NSString *objectName = [[self class] objectName];
  NSMutableArray *objectArray = [NSMutableArray array];

  if (objectName) {
    NSArray *array = (NSArray *)[self.dictionary objectForKey:objectName];
    
    for (id dic in array) {
      if ([dic isKindOfClass:[NSDictionary class]]) {
      id object = [[[self class] objectClass] objectWithDictionary:dic];
      [objectArray addObject:object];
      }
    }
  }
  
  return objectArray;    
}


/**
 Overwrited by subclass 
 */
+ (Class)objectClass {
  return nil;
}


/**
 Overwrited by subclass 
 */
+ (NSString *)objectName {
  return nil;
}




@end
