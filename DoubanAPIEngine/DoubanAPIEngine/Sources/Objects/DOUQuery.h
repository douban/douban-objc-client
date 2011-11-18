//
//  DOUQuery.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DOUQuery : NSObject {
 @private
  NSString     *subPath_;
  NSDictionary *parameters_;
}

@property (nonatomic, copy) NSString *subPath;
@property (nonatomic, retain) NSDictionary *parameters;

- (id)initWithSubPath:(NSString *)aSubPath parameters:(NSDictionary *)theParameters;

- (NSString *)requestUrl;

@end
