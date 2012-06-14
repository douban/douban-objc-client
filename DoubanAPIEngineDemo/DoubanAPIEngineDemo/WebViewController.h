//
//  WebViewController.h
//  DoubanAPIEngineDemo
//
//  Created by Lin GUO on 3/26/12.
//  Copyright (c) 2012 douban Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DOUOAuthService.h"

@interface WebViewController : UIViewController<UIWebViewDelegate, DOUOAuthServiceDelegate>

- (id)initWithRequestURL:(NSURL *)aURL;

@end
