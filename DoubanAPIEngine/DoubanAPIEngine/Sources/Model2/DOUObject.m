//
//  DOUObject.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"
#import "SBJson.h"


@implementation DOUObject

@dynamic string;
@synthesize dictionary = dictionary_;


- (id)init {
  self = [super init];
  if (self) {
    self.dictionary = [NSMutableDictionary dictionary];
  }
  return  self;
}


- (id)initWithString:(NSString *)theJsonStr {
  self = [super init];
  if (self) {
    if (!theJsonStr || [theJsonStr length] <= 0) {
      return nil;
    }

    NSMutableDictionary *dic = (NSMutableDictionary *)[theJsonStr JSONValue]; 
    if (!dic) {
      return nil;
    }
    
    self.dictionary = dic;
  }
  return self;
}


- (id)initWithDictionary:(NSDictionary *)theDictionary {
  self = [super init];
  if (self) {
    self.dictionary = [[[NSMutableDictionary alloc] initWithDictionary:theDictionary] autorelease];
  }
  return self;
}


+ (id)objectWithString:(NSString *)theJsonStr {
  id newInstance = [[[[self class] alloc] initWithString:theJsonStr] autorelease];
  return newInstance;
}


+ (id)objectWithDictionary:(NSDictionary *)theDictionary {
  id newInstance = [[[[self class] alloc] initWithDictionary:theDictionary] autorelease];
  return newInstance;
}



- (void)dealloc {
  [dictionary_ release]; dictionary_ = nil;
  [super dealloc];
}


- (NSString *)string {
  if (self.dictionary) {
    NSString *result = [self.dictionary JSONRepresentation];
    return result;      
  }
  return nil;
}


- (void)setString:(NSString *)theJsonStr {
  NSMutableDictionary *dic = (NSMutableDictionary *)[theJsonStr JSONValue]; 
  if (!dic) {
    return ;
  }
  self.dictionary = dic;
}


@end
