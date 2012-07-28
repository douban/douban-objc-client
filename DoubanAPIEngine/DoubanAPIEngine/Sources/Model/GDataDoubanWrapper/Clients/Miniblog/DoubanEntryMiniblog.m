//
//  DoubanEntryMiniblog.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-9.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#define DOUBANENTRYMINIBLOG_DEFINE_GLOBALS 1

#import "DoubanEntryMiniblog.h"
#import "DoubanDefines.h"


@implementation DoubanEntryMiniblog

static NSString * const kMiniblogSayingCategoryTerm = @"http://www.douban.com/2007#miniblog.saying";

static NSString * const kMiniblogBookCategoryTerm = @"http://www.douban.com/2007#miniblog.book";
static NSString * const kMiniblogMagazineCategoryTerm = @"http://www.douban.com/2007#miniblog.magazine";
static NSString * const kMiniblogMovieCategoryTerm = @"http://www.douban.com/2007#miniblog.movie";
static NSString * const kMiniblogTvCategoryTerm = @"http://www.douban.com/2007#miniblog.tv";
static NSString * const kMiniblogMusicCategoryTerm = @"http://www.douban.com/2007#miniblog.music";

static NSString * const kMiniblogPlaceCategoryTerm = @"http://www.douban.com/2007#miniblog.place";
static NSString * const kMiniblogGroupCategoryTerm = @"http://www.douban.com/2007#miniblog.group";
static NSString * const kMiniblogEventCategoryTerm = @"http://www.douban.com/2007#miniblog.event";

static NSString * const kMiniblogSiteCategoryTerm = @"http://www.douban.com/2007#miniblog.site";
static NSString * const kMiniblogRecommendationCategoryTerm = @"http://www.douban.com/2007#miniblog.recommendation";
static NSString * const kMiniblogNoteCategoryTerm = @"http://www.douban.com/2007#miniblog.note";
static NSString * const kMiniblogBlogCategoryTerm = @"http://www.douban.com/2007#miniblog.blog";
static NSString * const kMiniblogPhotoCategoryTerm = @"http://www.douban.com/2007#miniblog.photo";
static NSString * const kMiniblogContactCategoryTerm = @"http://www.douban.com/2007#miniblog.contact";
static NSString * const kMiniblogPlazaCategoryTerm = @"http://www.douban.com/2007#miniblog.plaza";
static NSString * const kMiniblogSignatureCategoryTerm = @"http://www.douban.com/2007#miniblog.signature";


@dynamic miniblogCategory;


+ (NSString *)standardEntryKind {
	return kDoubanCategoryMiniblog;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanMiniblogsDefaultServiceVersion;
}


#pragma mark - Extensions

- (MiniblogCategory)miniblogCategory {
  NSArray *categories = [self categories];
  GDataCategory *category = [categories objectAtIndex:0];
  NSString *categoryTerm = [category term];
  
 if ([categoryTerm isEqualToString:kMiniblogBookCategoryTerm]) {
    return MINIBLOG_BOOK_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogMagazineCategoryTerm]) {
    return MINIBLOG_MAGAZINE_CATEGORY;
  }  
  else if ([categoryTerm isEqualToString:kMiniblogMovieCategoryTerm]) {
    return MINIBLOG_MOVIE_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogTvCategoryTerm]) {
    return MINIBLOG_TV_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogMusicCategoryTerm]) {
    return MINIBLOG_MUSIC_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogPlaceCategoryTerm]) {
    return MINIBLOG_PLACE_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogGroupCategoryTerm]) {
    return MINIBLOG_GROUP_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogEventCategoryTerm]) {
    return MINIBLOG_EVENT_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogSiteCategoryTerm]) {
    return MINIBLOG_SITE_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogRecommendationCategoryTerm]) {
    return MINIBLOG_RECOMMENDATION_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogNoteCategoryTerm]) {
    return MINIBLOG_NOTE_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogBlogCategoryTerm]) {
    return MINIBLOG_BLOG_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogContactCategoryTerm]) {
    return MINIBLOG_CONTACT_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogPlazaCategoryTerm]) {
    return MINIBLOG_PLAZA_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kMiniblogSignatureCategoryTerm]) {
    return MINIBLOG_SIGNATURE_CATEGORY;
  }  
  else {
    return MINIBLOG_SAYING_CATEGORY;
  }
}


@end
