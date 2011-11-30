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
@end


@implementation DOUOAuth2Consumer

static NSString *kUserDefaultsAccessTokenKey = @"douban_userdefaults_access_token";
static NSString *kUserDefaultsRefreshTokenKey = @"douban_userdefaults_refresh_token";
static NSString *kUserDefaultsExpiresInKey = @"douban_userdefaults_expires_in";
static NSString *kUserDefaultsUserIdKey = @"douban_userdefaults_user_in";


@synthesize key    = key_;
@synthesize secret = secret_;
@synthesize redirectURL  = redirectURL_;

@synthesize accessToken  = accessToken_;
@synthesize refreshToken = refreshToken_;
@synthesize expiresIn = expiresIn_;

@synthesize userId = userId_;

@synthesize hasExpired = hasExpired_;

- (id)init {
  self = [super init];
  if (self) {
    key_ = kAPIKey;
    secret_ = kPrivateKey;
    redirectURL_ = kRedirectUrl;
    
    accessToken_ = nil;
    refreshToken_ = nil;
    expiresIn_ = nil;
    hasExpired_ = NO;
  }
  return self;
}

- (id)initWithKey:(NSString *)aKey secret:(NSString *)aSecret andRedirectURL:(NSString *)aRedirectURL {
	self = [super init];
	if( self ) {
		key_ = [aKey retain];
		secret_ = [aSecret retain];
		redirectURL_ = [aRedirectURL retain];
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
  accessToken_ = [[dic objectForKey:kAccessTokenKey] retain];
  refreshToken_ = [[dic objectForKey:kRefreshTokenKey] retain];
  
  NSUInteger expiresSecond = [[dic objectForKey:kExpiresInKey] integerValue];
  NSDate *now = [NSDate date];
  expiresIn_ = [[now dateByAddingTimeInterval:expiresSecond] retain];
  
  userId_ = [[dic objectForKey:kDoubanUserIdKey] intValue];
}


- (void)sign:(DOUHttpRequest *)request {
  NSString *authValue = [NSString stringWithFormat:@"%@ %@",kOAuth2, self.accessToken];
  //NSLog(@"token:%@", authValue);
  [request addRequestHeader:kOAuth2AuthorizationHttpHeader value:authValue];
}

- (BOOL)isValid {
  
  if (hasExpired_) {
    return NO;
  }
  
  NSDate *now = [NSDate date];
  if( [now compare:[self expiresIn]] == NSOrderedAscending ){
		return YES;
	}
	else{
		return NO;
	}
}


- (void)save {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setObject:[self accessToken] forKey:kUserDefaultsAccessTokenKey];
  [userDefaults setObject:[self refreshToken] forKey:kUserDefaultsRefreshTokenKey];
  [userDefaults setObject:[self expiresIn] forKey:kUserDefaultsExpiresInKey];
  [userDefaults setInteger:[self userId] forKey:kUserDefaultsUserIdKey];
  [userDefaults synchronize];
}


- (void)updateWithUserDefaults {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  accessToken_ = [[userDefaults stringForKey:kUserDefaultsAccessTokenKey] retain];
  refreshToken_ = [[userDefaults stringForKey:kUserDefaultsRefreshTokenKey] retain];
  expiresIn_ = [[userDefaults objectForKey:kUserDefaultsExpiresInKey] retain];
  userId_ = [[userDefaults objectForKey:kUserDefaultsUserIdKey] intValue];
}


- (NSString*)description {
  return [NSString stringWithFormat:@"%@\r\ntoken = %@\r\nexpiry = %@",[super description], accessToken_, expiresIn_];
}


@end
