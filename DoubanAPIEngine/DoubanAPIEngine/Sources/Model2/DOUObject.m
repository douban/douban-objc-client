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

@synthesize string = string_;
@synthesize dictionary = dictionary_;


- (id)initWithString:(NSString *)theJsonStr {
  self = [super init];
  if (self) {
    if (!theJsonStr || [theJsonStr length] <= 0) {
      return nil;
    }
    
    self.string = theJsonStr;
    
    NSDictionary *dic = (NSDictionary *)[theJsonStr JSONValue]; 
    self.dictionary = [[[NSMutableDictionary alloc] initWithDictionary:dic] autorelease];
  }
  return self;
}


- (id)initWithDictionary:(NSDictionary *)theDictionary {
  self = [super init];
  if (self) {
    self.dictionary = [[[NSMutableDictionary alloc] initWithDictionary:theDictionary] autorelease];
    NSString *result = [self.dictionary JSONRepresentation];
    self.string = result;
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
  [string_ release]; string_ = nil;
  [dictionary_ release]; dictionary_ = nil;
  [super dealloc];
}


@end
