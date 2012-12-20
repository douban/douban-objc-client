//
//  DOUService.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUHttpRequest.h"


@class ASINetworkQueue;
@interface DOUService : NSObject {
 @private
  ASINetworkQueue   *queue_;  
  NSString          *apiBaseUrlString_;  
  NSString          *clientId_;
  NSString          *clientSecret_;
}

@property (nonatomic, copy) NSString *apiBaseUrlString;
@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *clientSecret;


+ (DOUService *)sharedInstance;

- (BOOL)isValid;

- (void)addRequest:(DOUHttpRequest *)request;


#if NS_BLOCKS_AVAILABLE

- (DOUHttpRequest *)get:(DOUQuery *)query callback:(DOUReqBlock)block;

- (DOUHttpRequest *)post:(DOUQuery *)query 
                postBody:(NSString *)body 
                callback:(DOUReqBlock)block;

- (DOUHttpRequest *)post:(DOUQuery *)query
               photoData:(NSData *)photoData
             description:(NSString *)description
                callback:(DOUReqBlock)block
  uploadProgressDelegate:(id<ASIProgressDelegate>)progressDelegate;

// v2 api post image
- (DOUHttpRequest *)post2:(DOUQuery *)query
                photoData:(NSData *)photoData
              description:(NSString *)description
                 callback:(DOUReqBlock)block
   uploadProgressDelegate:(id<ASIProgressDelegate>)progressDelegate;

- (DOUHttpRequest *)delete:(DOUQuery *)query callback:(DOUReqBlock)block;

#endif


- (DOUHttpRequest *)get:(DOUQuery *)query delegate:(id<DOUHttpRequestDelegate>)delegate;

- (DOUHttpRequest *)post:(DOUQuery *)query postBody:(NSString *)body delegate:(id<DOUHttpRequestDelegate>)delegate;

- (DOUHttpRequest *)delete:(DOUQuery *)query delegate:(id<DOUHttpRequestDelegate>)delegate;


@end
