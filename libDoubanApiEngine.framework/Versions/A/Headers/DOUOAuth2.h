//
//  DOUOAuth2Client.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 31/10/2011.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kOAuthErrorDomain = @"kOAuthErrorDomain";

static NSInteger const kOAuthErrorInvalidRequestScheme       = 100;
static NSInteger const kOAuthErrorInvalidRequestMethod       = 101;
static NSInteger const kOAuthErrorAccessTokenIsMissing       = 102;
static NSInteger const kOAuthErrorInvalidAccessToken         = 103;
static NSInteger const kOAuthErrorInvalidAPIKey              = 104;
static NSInteger const kOAuthErrorAPIKeyIsBlocked            = 105;
static NSInteger const kOAuthErrorAccessTokenHasExpired      = 106;
static NSInteger const kOAuthErrorInvalidRequestUri          = 107; 
static NSInteger const kOAuthErrorInvalidCredencial          = 108;
static NSInteger const kOAuthErrorInvalidCredencial2         = 109;
static NSInteger const kOAuthErrorNotTrialUser               = 110;
static NSInteger const kOAuthErrorRateLimitExceeded          = 111;
static NSInteger const kOAuthErrorRateLimitExceeded2         = 112;
static NSInteger const kOAuthErrorRequiredParameterIsMissing = 113;
static NSInteger const kOAuthErrorUnsupportedGrantType       = 114;
static NSInteger const kOAuthErrorUnsupportedResponseType    = 115;
static NSInteger const kOAuthErrorClientSecretMismatch       = 116;
static NSInteger const kOAuthErrorRedirectUriMismatch        = 117;
static NSInteger const kOAuthErrorInvalidAuthorizationCode   = 118;
static NSInteger const kOAuthErrorInvalidRefreshToken        = 119;
static NSInteger const kOAuthErrorUsernamePasswordMismatch   = 120;
static NSInteger const kOAuthErrorInvalidUser                = 121;
static NSInteger const kOAuthErrorUserHasBlocked             = 122;
static NSInteger const kOAuthErrorAccessTokenHasExpiredSincePasswordChanged = 123;
static NSInteger const kOAuthErrorAccessTokenHasNotExpired   = 124;
static NSInteger const kOAuthErrorUnknown                    = 999;


static NSString * const kClientIdKey = @"client_id";
static NSString * const kClientSecretKey = @"client_secret";
static NSString * const kRedirectURIKey = @"redirect_uri";

static NSString * const kGrantTypeKey = @"grant_type";
static NSString * const kAccessTokenKey = @"access_token";
static NSString * const kRefreshTokenKey = @"refresh_token";

static NSString * const kExpiresInKey = @"expires_in";
static NSString * const kScopeKey = @"scope";
static NSString * const kStateKey = @"state";

static NSString * const kUserIdKey = @"user_id";
static NSString * const kGrantTypeAuthorizationCode = @"authorization_code";
static NSString * const kGrantTypeRefreshToken = @"refresh_token";
static NSString * const kGrantTypePassword = @"password";

static NSString * const kUsernameKey = @"username";
static NSString * const kPasswordKey = @"password";


static NSString * const kDoubanUserIdKey = @"douban_user_id";

static NSString * const kOAuth2ResponseType = @"response_type";
static NSString * const kOAuth2ResponseTypeCode = @"code";
static NSString * const kOAuth2ResponseTypeToken = @"refresh_token";


