//
//  DOUPhotoTests.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DOUPhoto.h"
#import "DOUPhotoArray.h"
#import "DOUAlbum.h"
#import "DOUUser.h"


@interface DOUPhotoTests : SenTestCase

@end


@implementation DOUPhotoTests

- (void)testOnline {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Photo" ofType:@"json"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUPhoto *photo = [[DOUPhoto alloc] initWithString:string];
  STAssertTrue([photo.identifier isEqualToString:@"1328238583"], @"identifier");
  STAssertTrue([photo.alt isEqualToString:@"http://www.douban.com/photos/photo/1328238583/"], @"alt");
  STAssertNotNil(photo.desc, @"desc");

  STAssertTrue([photo.albumId isEqualToString:@"61434971"], @"albumId");
  
  STAssertTrue(photo.likedCount == 120, @"likedCount");
  STAssertTrue(photo.recsCount == 20, @"recsCount");
  STAssertTrue(photo.commentsCount == 10, @"commentsCount");

  
  STAssertTrue([photo.icon isEqualToString:@"http://img1.douban.com/view/photo/icon/public/p1328238583.jpg"], @"icon");
  STAssertTrue([photo.thumb isEqualToString:@"http://img1.douban.com/view/photo/thumb/public/p1328238583.jpg"], @"thumb");
  STAssertTrue([photo.cover isEqualToString:@"http://img1.douban.com/view/photo/cover/public/p1328238583.jpg"], @"cover");
  STAssertTrue([photo.image isEqualToString:@"http://img1.douban.com/view/photo/image/public/p1328238583.jpg"], @"image");
  
  STAssertNotNil(photo.author, @"author");
  
  STAssertTrue([photo.author.identifier isEqualToString:@"1645921"], @"author identifier");
  STAssertTrue([photo.author.avatar isEqualToString:@"http://img3.douban.com/icon/u1645921-14.jpg"], @"author avatar");
  STAssertTrue([photo.author.alt isEqualToString:@"http://www.douban.com/people/bear/"], @"author alt");
  STAssertTrue([photo.author.name isEqualToString:@"Bear"], @"author name");
  STAssertTrue([photo.author.uid isEqualToString:@"bear"], @"author uid");
  
  STAssertTrue(photo.liked == FALSE, @"liked");
}


- (void)testOnlineArray {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"PhotoArray" ofType:@"json"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUPhotoArray *photos = [[DOUPhotoArray alloc] initWithString:string];
  
  STAssertTrue(photos.count == 3, @"count");
  STAssertTrue(photos.start == 0, @"start");
  STAssertTrue(photos.total  == 17, @"total");
  STAssertTrue([photos.sortBy isEqualToString:@"time"], @"sortby");
  STAssertTrue([photos.order isEqualToString:@"asc"], @"order");

  STAssertTrue([photos.objectArray count]  == 3, @"objectArray");
  
  for (DOUPhoto *photo in photos.objectArray) {
    if ([photo.identifier isEqualToString:@"1328238489"]) {
      STAssertTrue([photo.alt isEqualToString:@"http://www.douban.com/photos/photo/1328238489/"], @"alt"); 
    }
    
    if ([photo.identifier isEqualToString:@"1328238583"]) {
      STAssertTrue([photo.alt isEqualToString:@"http://www.douban.com/photos/photo/1328238583/"], @"alt"); 
    }
    
    if ([photo.identifier isEqualToString:@"1328238698"]) {
      STAssertTrue([photo.alt isEqualToString:@"http://www.douban.com/photos/photo/1328238698/"], @"alt"); 
    }
  }
  
}


- (void)testAlbum {
  NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Album" ofType:@"json"];  
  if (!filePath)
    STAssertTrue(FALSE, @"path fail");
  
  NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
  DOUAlbum *album = [[DOUAlbum alloc] initWithString:string];
  STAssertTrue([album.identifier isEqualToString:@"61434971"], @"identifier");
  STAssertTrue([album.title isEqualToString:@"罗马 - 古堡酒店"], @"title");

  STAssertTrue([album.alt isEqualToString:@"http://www.douban.com/photos/album/61434971/"], @"alt");
  STAssertNotNil(album.desc, @"desc");
    
  STAssertTrue(album.likedCount == 120, @"likedCount");
  STAssertTrue(album.recsCount == 20, @"recsCount");
  STAssertTrue(album.size == 17, @"size");
  
  STAssertTrue([album.icon isEqualToString:@"http://img3.douban.com/view/photo/icon/public/p1328238698.jpg"], @"icon");
  STAssertTrue([album.thumb isEqualToString:@"http://img3.douban.com/view/photo/thumb/public/p1328238698.jpg"], @"thumb");
  STAssertTrue([album.cover isEqualToString:@"http://img3.douban.com/view/photo/cover/public/p1328238698.jpg"], @"cover");
  STAssertTrue([album.image isEqualToString:@"http://img3.douban.com/view/photo/image/public/p1328238698.jpg"], @"image");
  
  STAssertNotNil(album.author, @"author");
  
  STAssertTrue([album.author.identifier isEqualToString:@"1645921"], @"author identifier");
  STAssertTrue([album.author.avatar isEqualToString:@"http://img3.douban.com/icon/u1645921-14.jpg"], @"author avatar");
  STAssertTrue([album.author.alt isEqualToString:@"http://www.douban.com/people/bear/"], @"author alt");
  STAssertTrue([album.author.name isEqualToString:@"Bear"], @"author name");
  STAssertTrue([album.author.uid isEqualToString:@"bear"], @"author uid");
  
  STAssertTrue(album.liked == FALSE, @"liked");
}

@end
