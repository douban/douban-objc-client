//
//  DoubanEntryPhoto.h
//  douban-objective-c
//
//  Created by py on 4/6/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"
#import "GDataBaseElements.h"

#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBANPHOTOS_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanPhotosDefaultServiceVersion _INITIALIZE_AS(@"2.0");



@interface DoubanEntryPhoto : GDataEntryBase

- (GDataLink *)imageLink;
- (GDataLink *)thumbLink;
- (GDataLink *)albumcoverLink;
- (GDataLink *)iconLink;

- (NSInteger)commentsCount;
- (NSInteger)recsCount;
- (NSInteger)position;
- (NSInteger)nextPhotoId;
- (NSInteger)prevPhotoId;
- (NSInteger)albumId;
- (NSString *)albumTitle;

@end
