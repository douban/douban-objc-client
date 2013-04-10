//
//  StatusController.m
//  DoubanAPIEngineDemo
//
//  Created by GUO Lin on 11/23/12.
//
//

#import "StatusController.h"
#import "DOUQuery.h"
#import "DOUAPIEngine.h"


@interface DoubanQueryStatus : DOUQuery

+ (id)queryForStatus;

@end


@implementation DoubanQueryStatus

+ (id)queryForStatus {
  NSString *subPath = @"/shuo/v2/statuses/";
  
  DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];
  
  return [query autorelease];
}

@end




@interface StatusController ()

@property (nonatomic, retain) UITextView       *contentField;

@end


@implementation StatusController

@synthesize contentField = contentField_;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"发广播 v2";
  self.view.backgroundColor = [UIColor whiteColor];
  
  UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                              target:self
                                                                              action:@selector(post)];
  self.navigationItem.rightBarButtonItem = buttonItem;
  [buttonItem release];
  
  contentField_ = [[UITextView alloc] initWithFrame:CGRectMake(30, 10, 260, 140)];
  contentField_.autocapitalizationType = UITextAutocapitalizationTypeNone;
  contentField_.showsHorizontalScrollIndicator = YES;
  contentField_.returnKeyType = UIReturnKeyDone;
  contentField_.delegate = self;
  contentField_.backgroundColor = [UIColor lightGrayColor];
  [self.view addSubview:contentField_];
  contentField_.text = @"来一发";
  [contentField_ becomeFirstResponder];
}


- (void)dealloc {
  [contentField_ release];
  [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 * 需要 scope: shuo_basic_w
 */
- (void)post {
  
  DOUQuery *query = [DoubanQueryStatus queryForStatus];
  
  DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
    
    NSLog(@"code:%d, str:%@", [req responseStatusCode], [req responseString]);
    NSError *theError = [req doubanError];
    if (!theError) {
      NSLog(@"发送成功");
    }
    else {
      NSLog(@"%@", theError);
    }
    
  };
  
  NSString *text = contentField_.text;
  if (!text || [text length] == 0) {
    text = @"来一发";
  }
  NSMutableString *postBody = [NSMutableString stringWithFormat:@"text=%@", text];
  DOUService *service = [DOUService sharedInstance];
  NSLog(@"postBody:%@", postBody);
  [service post:query postBody:postBody callback:completionBlock];
  
}


@end
