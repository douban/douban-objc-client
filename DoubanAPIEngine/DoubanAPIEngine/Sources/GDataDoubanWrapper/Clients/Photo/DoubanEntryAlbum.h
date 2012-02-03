//
//  DoubanEntryAlbum.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/31/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataEntryBase.h"
#import "GDataBaseElements.h"

#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBANENTRYALBUM_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanAlbumsDefaultServiceVersion _INITIALIZE_AS(@"2.0");

@interface DoubanEntryAlbum : GDataEntryBase

@property (nonatomic, readonly) GDataAtomAuthor *author;
@property (nonatomic, readonly) GDataLink       *imageLink;
@property (nonatomic, readonly) GDataLink       *thumbLink;
@property (nonatomic, readonly) GDataLink       *albumCoverLink;
@property (nonatomic, readonly) GDataLink       *iconLink;

@property (nonatomic, readonly) NSInteger       size;
@property (nonatomic, readonly) NSString        *privacy;
@property (nonatomic, readonly) NSInteger       recsCount;
@property (nonatomic, readonly) NSInteger       likedCount;
@property (nonatomic, readonly) NSInteger       albumId;
@property (nonatomic, readonly) NSInteger       authorId;
@property (nonatomic, readonly) BOOL            liked;

@end
