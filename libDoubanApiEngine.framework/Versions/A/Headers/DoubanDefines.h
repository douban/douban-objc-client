//
//  DoubanDefines.h
//  douban-objective-c
//
//  Created by py on 3/18/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBAN_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanCategorySubject  _INITIALIZE_AS(@"http://www.douban.com/2007#subject");
_EXTERN NSString* const kDoubanCategoryMiniblog  _INITIALIZE_AS(@"http://www.douban.com/2007#miniblog");
_EXTERN NSString* const kDoubanCategoryRecommendation  _INITIALIZE_AS(@"http://www.douban.com/2007#recommendation");

_EXTERN NSString* const kDoubanCategoryComment  _INITIALIZE_AS(@"http://www.douban.com/2007#comment");

_EXTERN NSString* const kDoubanCategoryReview  _INITIALIZE_AS(@"http://www.douban.com/2007#review");
_EXTERN NSString* const kDoubanCategoryEvent  _INITIALIZE_AS(@"http://www.douban.com/2007#event");
_EXTERN NSString* const kDoubanCategoryPeople  _INITIALIZE_AS(@"http://www.douban.com/2007#people");
_EXTERN NSString* const kDoubanCategoryPhoto  _INITIALIZE_AS(@"http://www.douban.com/2007#photo");
_EXTERN NSString* const kDoubanCategoryAlbum  _INITIALIZE_AS(@"http://www.douban.com/2007#album");

_EXTERN NSString* const kDoubanCategoryEventCategory  _INITIALIZE_AS(@"http://www.douban.com/2007#category");
_EXTERN NSString* const kDoubanCategoryCityCategory _INITIALIZE_AS(@"http://www.douban.com/2007#city");

_EXTERN NSString* const kDoubanNamespace _INITIALIZE_AS(@"http://www.douban.com/xmlns/");
_EXTERN NSString* const kDoubanNamespacePrefix _INITIALIZE_AS(@"db");

_EXTERN NSString* const kAtomNamespace _INITIALIZE_AS(@"http://www.w3.org/2005/Atom");
_EXTERN NSString* const kAtomNamespacePrefix _INITIALIZE_AS(@"ns0");

_EXTERN NSString* const kGeorssNamespace _INITIALIZE_AS(@"http://www.georss.org/georss");
_EXTERN NSString* const kGeorssNamespacePrefix _INITIALIZE_AS(@"georess");

