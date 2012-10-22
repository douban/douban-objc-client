//
//  DOULoc.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 9/7/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOULoc.h"

@implementation DOULoc

@dynamic identifier;
@dynamic parent;
@dynamic name;
@dynamic uid;
@dynamic isHabitable;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (void)setIdentifier:(NSString *)identifier {
  [self.dictionary setValue:identifier forKey:@"id"];

}


- (NSString *)parent {
  return [self.dictionary objectForKey:@"parent"];
}

- (void)setParent:(NSString *)parent {
  return [self.dictionary setObject:parent forKey:@"parent"];
}


- (NSString *)name {
  return [self.dictionary objectForKey:@"name"];
}

-  (void)setName:(NSString *)name {
  return [self.dictionary setObject:name forKey:@"name"];
}


- (NSString *)uid {
  return [self.dictionary objectForKey:@"uid"];
}

- (void)setUid:(NSString *)uid {
  return [self.dictionary setObject:uid forKey:@"uid"];
}


- (BOOL)isHabitable {
  return [[self.dictionary objectForKey:@"habitable"] boolValue];
}


- (void)setIsHabitable:(BOOL)isHabitable {
  [self.dictionary setValue:[NSNumber numberWithBool:isHabitable] forKey:@"habitable"];
}


- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }
  if ([object isKindOfClass:[self class]]) {
    if (![[self identifier] isEqualToString:[(DOULoc *)object identifier]]) 
      return NO;
    
    return YES;
  }
  return NO;
}


- (NSUInteger)hash {
  return [[self identifier] hash];
}

@end
