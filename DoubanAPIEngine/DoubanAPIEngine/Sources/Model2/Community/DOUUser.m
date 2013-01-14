//
//  DOUUser.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUUser.h"

@implementation DOUUser

@dynamic identifier;
@dynamic avatar;
@dynamic alt;
@dynamic name;
@dynamic uid;
@dynamic desc;
@dynamic locId;
@dynamic locName;


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


- (NSString *)signature {
  return [self.dictionary objectForKey:@"signature"];
}


- (NSString *)uid {
  return [self.dictionary objectForKey:@"uid"];
}


- (NSString *)desc {
  return [self.dictionary objectForKey:@"desc"];
}


- (NSString *)locId {
  return [self.dictionary objectForKey:@"loc_id"];
}


- (NSString *)locName {
  return [self.dictionary objectForKey:@"loc_name"];
}


@end
