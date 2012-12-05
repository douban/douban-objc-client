//
//  DoubanEntryPhoto.h
//  douban-objective-c
//
//  Created by py on 4/6/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"

#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBANENTRYPHOTO_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanPhotosDefaultServiceVersion _INITIALIZE_AS(@"2.0");

@class GDataAtomAuthor;
@interface DoubanEntryPhoto : GDataEntryBase {

}

@property (nonatomic, readonly) GDataAtomAuthor *author;
@property (nonatomic, readonly) GDataLink       *imageLink;
@property (nonatomic, readonly) GDataLink       *thumbLink;
@property (nonatomic, readonly) GDataLink       *albumCoverLink;
@property (nonatomic, readonly) GDataLink       *iconLink;

@property (nonatomic, readonly) NSInteger       commentsCount;
@property (nonatomic, readonly) NSInteger       recsCount;
@property (nonatomic, readonly) NSInteger       likedCount;
@property (nonatomic, readonly) NSInteger       position;
@property (nonatomic, readonly) NSInteger       photoId;
@property (nonatomic, readonly) NSInteger       nextPhotoId;
@property (nonatomic, readonly) NSInteger       prevPhotoId;
@property (nonatomic, readonly) NSInteger       albumId;
@property (nonatomic, readonly) NSString        *albumTitle;

@end
