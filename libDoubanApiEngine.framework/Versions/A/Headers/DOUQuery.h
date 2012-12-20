//
//  DOUQuery.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// DOUQuery the class by which we can define the API Request.
//
@interface DOUQuery : NSObject {
 @private
  NSString     *subPath_;
  NSDictionary *parameters_;
  NSString     *apiBaseUrlString_;
}

@property (nonatomic, copy) NSString *subPath;
@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic, copy) NSString *apiBaseUrlString;

- (id)initWithSubPath:(NSString *)aSubPath parameters:(NSDictionary *)theParameters;

- (NSString *)requestURLString;

- (NSURL *)requestURL;

@end
