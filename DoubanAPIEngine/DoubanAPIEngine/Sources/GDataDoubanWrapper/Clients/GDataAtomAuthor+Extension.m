//
//  GDataAtomAuthor+Exentsion.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "GDataAtomAuthor+Exentsion.h"
#import "GDataLink.h"


@implementation GDataAtomAuthor (Exentsion)


- (NSArray *)links {
  NSArray *links = [self objectForExtensionClass:[GDataAtomAuthor class]];
  return links;
}


- (GDataLink *)linkWithRelAttributeValue:(NSString *)rel
                                    type:(NSString *)type {
  return [GDataLink linkWithRel:rel
                           type:type
                      fromLinks:[self links]];
}


- (GDataLink *)linkWithRelAttributeValue:(NSString *)rel {
  
  return [GDataLink linkWithRel:rel
                           type:nil
                      fromLinks:[self links]];
}



@end
