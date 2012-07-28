//
//  DOUPhotoArray.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUPhotoArray.h"
#import "DOUPhoto.h"
#import "DOUAlbum.h"


@implementation DOUPhotoArray

@dynamic sortBy;
@dynamic order;
@dynamic album;

+ (Class)objectClass {
  return [DOUPhoto class];
}


+ (NSString *)objectName {
  return @"photos";
}


- (NSString *)sortBy {
  return [self.dictionary objectForKey:@"sortby"];
}


- (NSString *)order {
  return [self.dictionary objectForKey:@"order"];
}


- (DOUAlbum *)album {
  NSDictionary *dic = [self.dictionary objectForKey:@"album"];
  DOUAlbum *album = [DOUAlbum objectWithDictionary:dic];
  return album;
}

@end
