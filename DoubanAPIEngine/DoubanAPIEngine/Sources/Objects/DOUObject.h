//
//  DOUObject.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-3.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DOUObject : NSObject {
 @protected
  NSString *jsonString_;
}

@property (nonatomic, copy) NSString *jsonString;

@end
