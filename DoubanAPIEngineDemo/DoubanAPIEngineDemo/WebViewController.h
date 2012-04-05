//
//  WebViewController.h
//  DoubanAPIEngineDemo
//
//  Created by Lin GUO on 3/26/12.
//  Copyright (c) 2012 douban Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DOUHttpRequest.h"

@interface WebViewController : UIViewController<UIWebViewDelegate, DOUHttpRequestDelegate>

- (id)initWithRequestURL:(NSURL *)aURL;

@end
