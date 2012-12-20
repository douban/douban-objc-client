//
//  WebViewController.m
//  DoubanAPIEngineDemo
//
//  Created by Lin GUO on 3/26/12.
//  Copyright (c) 2012 douban Inc. All rights reserved.
//

#import "WebViewController.h"
#import "DOUAPIEngine.h"


static NSString * const kAPIKey = @"04e0b2ab7ca02a8a0ea2180275e07f9e";
static NSString * const kPrivateKey = @"4275ee2fa3689a2f";
static NSString * const kRedirectUrl = @"http://www.douban.com/location/mobile";


@interface NSString (ParseCategory)
- (NSMutableDictionary *)explodeToDictionaryInnerGlue:(NSString *)innerGlue 
                                           outterGlue:(NSString *)outterGlue;
@end

@implementation NSString (ParseCategory)

- (NSMutableDictionary *)explodeToDictionaryInnerGlue:(NSString *)innerGlue 
                                           outterGlue:(NSString *)outterGlue {
  // Explode based on outter glue
  NSArray *firstExplode = [self componentsSeparatedByString:outterGlue];
  NSArray *secondExplode;
  
  // Explode based on inner glue
  NSInteger count = [firstExplode count];
  NSMutableDictionary* returnDictionary = [NSMutableDictionary dictionaryWithCapacity:count];
  for (NSInteger i = 0; i < count; i++) {
    secondExplode = 
    [(NSString*)[firstExplode objectAtIndex:i] componentsSeparatedByString:innerGlue];
    if ([secondExplode count] == 2) {
      [returnDictionary setObject:[secondExplode objectAtIndex:1] 
                           forKey:[secondExplode objectAtIndex:0]];
    }
  }
  return returnDictionary;
}

@end


@interface WebViewController ()

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) NSURL *requestURL;

@end


@implementation WebViewController

@synthesize webView = webView_;
@synthesize requestURL = requestURL_;


#pragma mark - View lifecycle

- (id)initWithRequestURL:(NSURL *)aURL {
  self = [super init];
  if (self) {
    self.requestURL = aURL;
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationItem.title = @"登录"; 
  webView_ = [[UIWebView alloc] initWithFrame:CGRectMake(0, 
                                                         0, 
                                                         self.view.bounds.size.width, 
                                                         self.view.bounds.size.height - 49)];
  webView_.scalesPageToFit = YES;
  webView_.delegate = self;
  NSURLRequest *request = [NSURLRequest requestWithURL:requestURL_];
  [webView_ loadRequest:request];
  [self.view addSubview:webView_];    

}


- (void)viewDidUnload {
  self.webView = nil;
  self.requestURL = nil;
  [super viewDidUnload];
}


- (void)dealloc {
  [webView_ release];
  [requestURL_ release];
  [super dealloc];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
  
  NSURL *urlObj =  [request URL];
  NSString *url = [urlObj absoluteString];
  
   
  if ([url hasPrefix:kRedirectUrl]) {
    
    NSString* query = [urlObj query];
    NSMutableDictionary *parsedQuery = [query explodeToDictionaryInnerGlue:@"=" 
                                                                outterGlue:@"&"];

    //access_denied
    NSString *error = [parsedQuery objectForKey:@"error"];
    if (error) {
        return NO;
    }
      
    //access_accept
    NSString *code = [parsedQuery objectForKey:@"code"];
    DOUOAuthService *service = [DOUOAuthService sharedInstance];
    service.authorizationURL = kTokenUrl;
    service.delegate = self;
    service.clientId = kAPIKey;
    service.clientSecret = kPrivateKey;
    service.callbackURL = kRedirectUrl;
    service.authorizationCode = code;

    [service validateAuthorizationCode];
    
    return NO;
  }
  
  return YES;
}


- (void)OAuthClient:(DOUOAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic {
  NSLog(@"success!");
  [self.navigationController popViewControllerAnimated:YES];

}

- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error {
  NSLog(@"Fail!");
}



@end
