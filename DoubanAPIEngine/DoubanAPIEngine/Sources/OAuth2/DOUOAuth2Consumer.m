//
//  DOUOAuth2Consumer.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//


#import "DOUOAuth2.h"
#import "DOUOAuth2Consumer.h"
#import "DOUHttpRequest.h"
#import "DOUAPIConfig.h"
#import "SBJson.h"

@interface DOUOAuth2Consumer ()
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *refreshToken;
@property (nonatomic, copy) NSDate *expiresIn;
@property (nonatomic, assign) int userId;
@end


@implementation DOUOAuth2Consumer

static NSString *kUserDefaultsAccessTokenKey = @"douban_userdefaults_access_token";
static NSString *kUserDefaultsRefreshTokenKey = @"douban_userdefaults_refresh_token";
static NSString *kUserDefaultsExpiresInKey = @"douban_userdefaults_expires_in";
static NSString *kUserDefaultsUserIdKey = @"douban_userdefaults_user_id";


@synthesize key    = key_;
@synthesize secret = secret_;
@synthesize redirectURL  = redirectURL_;

@synthesize accessToken  = accessToken_;
@synthesize refreshToken = refreshToken_;
@synthesize expiresIn = expiresIn_;
@synthesize userId = userId_;


- (id)initWithKey:(NSString *)aKey secret:(NSString *)aSecret redirectURL:(NSString *)aRedirectURL {
	self = [super init];
	if( self ) {
		key_ = [aKey retain];
		secret_ = [aSecret retain];
		redirectURL_ = [aRedirectURL retain];
    [self updateWithUserDefaults];
	}
	return self;
}


- (void)dealloc {
  [key_ release]; key_ = nil;
	[secret_ release]; secret_ = nil;
	[redirectURL_ release];	redirectURL_ = nil;
  
  [accessToken_ release];	accessToken_ = nil;
	[refreshToken_ release]; refreshToken_ = nil;
  [expiresIn_ release]; expiresIn_ = nil;
	[super dealloc];
}


- (void)updateWithHTTPResponse:(NSString *)aString {

  NSDictionary *dic = [aString JSONValue];
  self.accessToken = [dic objectForKey:kAccessTokenKey];
  self.refreshToken = [dic objectForKey:kRefreshTokenKey];
  
  NSUInteger expiresSecond = [[dic objectForKey:kExpiresInKey] integerValue];
  self.expiresIn = [[NSDate date] dateByAddingTimeInterval:expiresSecond];
  self.userId = [[dic objectForKey:kDoubanUserIdKey] intValue];
}


- (void)sign:(DOUHttpRequest *)request {
  if (self.accessToken) {
    NSString *authValue = [NSString stringWithFormat:@"%@ %@", kOAuth2, self.accessToken];
    //NSLog(@"token:%@", authValue);
    [request addRequestHeader:kOAuth2AuthorizationHttpHeader value:authValue];    
  }
}


- (BOOL)hasExpired {
  NSDate *now = [NSDate date];
  if([now compare:self.expiresIn] == NSOrderedAscending) {
		return NO;
	}
	else{
		return YES;
	}
}


- (void)save {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:accessToken_ forKey:kUserDefaultsAccessTokenKey];
  [userDefaults setObject:refreshToken_ forKey:kUserDefaultsRefreshTokenKey];
  [userDefaults setObject:expiresIn_ forKey:kUserDefaultsExpiresInKey];
  [userDefaults setInteger:userId_ forKey:kUserDefaultsUserIdKey];
  [userDefaults synchronize];
}


- (NSString *)accessToken {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  accessToken_ = [[userDefaults stringForKey:kUserDefaultsAccessTokenKey] retain];
  return accessToken_;
}


- (NSString *)refreshToken {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  refreshToken_ = [[userDefaults stringForKey:kUserDefaultsRefreshTokenKey] retain];
  return refreshToken_;
}


- (int)userId {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  userId_ = [[userDefaults objectForKey:kUserDefaultsUserIdKey] intValue];
  return userId_;
}


- (void)updateWithUserDefaults {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  self.accessToken = [userDefaults stringForKey:kUserDefaultsAccessTokenKey];
  self.refreshToken = [userDefaults stringForKey:kUserDefaultsRefreshTokenKey];
  self.expiresIn = [userDefaults objectForKey:kUserDefaultsExpiresInKey];
  self.userId = [[userDefaults objectForKey:kUserDefaultsUserIdKey] intValue];
}


- (NSString*)description {
  return [NSString stringWithFormat:@"%@\r\ntoken = %@\r\nexpiry = %@",[super description], accessToken_, expiresIn_];
}


@end
