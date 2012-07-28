//
//  DOUPeople.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUPeople.h"

@implementation DOUPeople

@dynamic identifier;
@dynamic avatar;
@dynamic alt;
@dynamic name;
@dynamic uid;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}


- (NSString *)avatar {
  return [self.dictionary objectForKey:@"avatar"];
}


- (NSString *)alt {
  return [self.dictionary objectForKey:@"alt"];
}


- (NSString *)name {
  return [self.dictionary objectForKey:@"name"];
}


- (NSString *)uid {
  return [self.dictionary objectForKey:@"uid"];
}

@end
