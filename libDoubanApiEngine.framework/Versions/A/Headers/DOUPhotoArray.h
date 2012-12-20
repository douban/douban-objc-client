//
//  DOUPhotoArray.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObjectArray.h"

@class DOUAlbum;
@interface DOUPhotoArray : DOUObjectArray

@property (nonatomic, copy) NSString *sortBy;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) DOUAlbum *album;

@end
