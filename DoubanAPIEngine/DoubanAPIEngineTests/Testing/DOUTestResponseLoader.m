//
//  DOUTestResponseLoader.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/17/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUTestResponseLoader.h"


NSString * const DOUTestResponseLoaderTimeoutException = @"DOUTestResponseLoaderTimeoutException";


@interface DOUTestResponseLoader ()

@property (nonatomic, assign, getter = isAwaitingResponse) BOOL awaitingResponse;
//@property (nonatomic, retain, readwrite) DOUHttpResponse *response;
@property (nonatomic, copy, readwrite) NSError *error;

@end

@implementation DOUTestResponseLoader

//@synthesize response;
@synthesize error;
@synthesize successful;
@synthesize timeout;
@synthesize cancelled;
@synthesize unexpectedResponse;
@synthesize awaitingResponse;


+ (DOUTestResponseLoader *)responseLoader {
  return [[[[self class] alloc] init] autorelease];
}


- (id)init {
  self = [super init];
  if (self) {
    timeout = 4;
    awaitingResponse = NO;
  }
  return self;
}


- (void)dealloc {
//  [response release]; response = nil;
  [error release]; error = nil;
  [super dealloc];
}


- (void)waitForResponse {
	awaitingResponse = YES;
	NSDate *startDate = [NSDate date];
  
	while (awaitingResponse) {
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
		if ([[NSDate date] timeIntervalSinceDate:startDate] > self.timeout) {
			[NSException raise:DOUTestResponseLoaderTimeoutException 
                  format:@"*** Operation timed out after %f seconds...", self.timeout];
			awaitingResponse = NO;
		}
	}
}


- (void)loadError:(NSError *)theError {
  awaitingResponse = NO;
  successful = NO;
  self.error = theError;
}


- (NSString *)errorMessage {
  if (self.error) {
    return [[self.error userInfo] valueForKey:NSLocalizedDescriptionKey];
  }
  return nil;
}


#pragma mark - DOUHttpRequestDelegate

- (void)request:(DOUHttpRequest *)aRequest didFail:(NSError *)anError {
  [self loadError:anError];
}


#pragma mark - DOUOAuthServiceDelegate

- (void)OAuthClient:(DOUOAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic {
  awaitingResponse = NO;
  successful = YES;
}


- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error {
  awaitingResponse = NO;
  successful = NO;
}


@end
