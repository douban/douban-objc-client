//
//  NavController.m
//  DoubanAPIEngineDemo
//
//  Created by Lin GUO on 3/26/12.
//  Copyright (c) 2012 douban Inc. All rights reserved.
//
#import <MobileCoreServices/MobileCoreServices.h>
#import "NavController.h"
#import "GetEventController.h"
#import "StatusController.h"
#import "WebViewController.h"
#import "DOUAPIEngine.h"


@implementation NavController

@synthesize tableView = tableView_;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"演示";
  }
  return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {

}


- (void)viewDidUnload {
  self.tableView = nil;
  [super viewDidUnload];
}


- (void)dealloc {
  [tableView_ release];
  [super dealloc];
}


#pragma mark -
#pragma mark UITableViewDataSource's methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString* cellIdentifier = @"TableViewCell";
  
  UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                   reuseIdentifier:cellIdentifier] autorelease];
  }
  
  NSUInteger row = [indexPath row];
  if (row == 0) {
    cell.textLabel.text = @"登录";
  }
  else if (row == 1) {
    cell.textLabel.text = @"条目信息 v2";
  }
  else if (row == 2) {
    cell.textLabel.text = @"发广播 v2";
  }
  else if (row == 3) {
    cell.textLabel.text = @"Post 照片 v2";
  }
  
  return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate's methods

static NSString * const kAPIKey = @"04e0b2ab7ca02a8a0ea2180275e07f9e";
static NSString * const kPrivateKey = @"4275ee2fa3689a2f";
static NSString * const kRedirectUrl = @"http://www.douban.com/location/mobile";


- (void)tableView:(UITableView *)tableView 
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  if ([indexPath row] == 0) {
    NSString *str = [NSString stringWithFormat:@"https://www.douban.com/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code", kAPIKey, kRedirectUrl];
    
    NSString *urlStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    UIViewController *webViewController = [[WebViewController alloc] initWithRequestURL:url];
    [self.navigationController pushViewController:webViewController animated:YES];
      [webViewController release];
  }
  else if ([indexPath row] == 1) {
    UIViewController *getEventController = [[GetEventController alloc] initWithNibName:@"GetEventController" 
                                                                                bundle:nil];
    [self.navigationController pushViewController:getEventController animated:YES];
      [getEventController release];
  }
   else if ([indexPath row] == 2){
    UIViewController *statusController = [[StatusController alloc] init];
    [self.navigationController pushViewController:statusController animated:YES];
       [statusController release];
  }
  else if ([indexPath row] == 3) {
      UIImagePickerController *photoController = [[[UIImagePickerController alloc] init]autorelease];
    photoController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.navigationController presentModalViewController:photoController animated:YES]; 
    photoController.delegate = self;
  }

  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info {

  NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
  
  if ([mediaType isEqualToString:(NSString *)kUTTypeMovie] == YES){

  }  
  else if ([mediaType isEqualToString:(NSString *)kUTTypeImage] == YES){
    UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
      UIImageWriteToSavedPhotosAlbum(pickedImage, nil, nil , nil);
    }
        
    NSData *imageData = UIImagePNGRepresentation(pickedImage);    
    DOUService *service = [DOUService sharedInstance];
    NSString *subPath = [NSString stringWithFormat:@"/album/%@", @"43672487"];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:subPath parameters:nil]autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
    
    };
  
    [service post2:query
         photoData:imageData
       description:@"description"
          callback:completionBlock
uploadProgressDelegate:nil];
    
  }
    
  
  [picker dismissModalViewControllerAnimated:YES];
  
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
  [picker dismissModalViewControllerAnimated:YES];
}

@end
