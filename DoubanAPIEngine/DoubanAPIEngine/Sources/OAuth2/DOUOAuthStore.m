//
//  DOUOAuth2Consumer.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-10-31.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUOAuthStore.h"
#import "DOUOAuth2.h"
#import "SBJson.h"


@interface DOUOAuthStore ()
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *refreshToken;
@property (nonatomic, copy) NSDate *expiresIn;
@property (nonatomic, assign) int userId;
@end


@implementation DOUOAuthStore

static NSString *kUserDefaultsAccessTokenKey = @"douban_userdefaults_access_token";
static NSString *kUserDefaultsRefreshTokenKey = @"douban_userdefaults_refresh_token";
static NSString *kUserDefaultsExpiresInKey = @"douban_userdefaults_expires_in";
static NSString *kUserDefaultsUserIdKey = @"douban_userdefaults_user_id";

@synthesize accessToken  = accessToken_;
@synthesize refreshToken = refreshToken_;
@synthesize expiresIn = expiresIn_;
@synthesize userId = userId_;


- (id)init {
	self = [super init];
	if( self ) {
    [self updateWithUserDefaults];
	}
	return self;
}


#pragma mark - Singleton

static DOUOAuthStore *myInstance = nil;

+ (DOUOAuthStore *)sharedInstance {
  
  @synchronized(self) {
    if (myInstance == nil) {
      myInstance = [[DOUOAuthStore alloc] init];
    }
    
  }
  return myInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
  @synchronized(self) {
    if (myInstance == nil) {
      myInstance = [super allocWithZone:zone];
      return myInstance;  // assignment and return on first allocation
    }
  }
  return nil; 
}


- (id)copyWithZone:(NSZone *)zone {
  return self;
}


- (id)retain {
  return self;
}


- (unsigned)retainCount {
  return UINT_MAX;
}


- (oneway void)release {
  //nothing
}


- (id)autorelease {
  return self;
}

- (void)dealloc {
  [accessToken_ release];	accessToken_ = nil;
	[refreshToken_ release]; refreshToken_ = nil;
  [expiresIn_ release]; expiresIn_ = nil;
	[super dealloc];
}


- (void)updateWithSuccessDictionary:(NSDictionary *)dic {

  self.accessToken = [dic objectForKey:kAccessTokenKey];
  self.refreshToken = [dic objectForKey:kRefreshTokenKey];
  
  NSUInteger expiresSecond = [[dic objectForKey:kExpiresInKey] integerValue];
  self.expiresIn = [[NSDate date] dateByAddingTimeInterval:expiresSecond];
  self.userId = [[dic objectForKey:kDoubanUserIdKey] intValue];
  [self save];
}


- (BOOL)hasExpired {
  NSDate *now = [NSDate date];
  NSDate *thirtyMinutesBeforeExpires = [self.expiresIn dateByAddingTimeInterval:-1800];
  if([now compare:thirtyMinutesBeforeExpires] == NSOrderedAscending) {
		return NO;
	}
	else {
		return YES;
	}
}


- (BOOL)shouldRefreshToken {
  NSDate *now = [NSDate date];
  NSDate *oneDayBeforeExpires = [self.expiresIn dateByAddingTimeInterval:-86400];
  if([now compare:oneDayBeforeExpires] == NSOrderedAscending) {
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


- (void)clear {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults removeObjectForKey:kUserDefaultsAccessTokenKey];
  [userDefaults removeObjectForKey:kUserDefaultsRefreshTokenKey];
  [userDefaults removeObjectForKey:kUserDefaultsExpiresInKey];
  [userDefaults removeObjectForKey:kUserDefaultsUserIdKey];
  [userDefaults synchronize];
}


- (NSString *)accessToken {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  self.accessToken = [userDefaults stringForKey:kUserDefaultsAccessTokenKey];
  //NSLog(@"token:%@", accessToken_);
  return accessToken_;
}


- (NSString *)refreshToken {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  self.refreshToken = [userDefaults stringForKey:kUserDefaultsRefreshTokenKey];
  return refreshToken_;
}


- (NSDate *)expiresIn {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  self.expiresIn = [userDefaults objectForKey:kUserDefaultsExpiresInKey];
  return expiresIn_;
}


- (int)userId {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  self.userId = [[userDefaults objectForKey:kUserDefaultsUserIdKey] intValue];
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
