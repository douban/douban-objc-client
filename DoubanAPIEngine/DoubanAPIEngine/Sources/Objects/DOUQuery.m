//
//  DOUQuery.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-1.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DOUQuery.h"
#import "DOUAPIConfig.h"

@interface DOUQuery ()
- (NSString *)parametersUrlString;
@end


@implementation DOUQuery

@synthesize subPath = subPath_;
@synthesize parameters = parameters_;


- (id)initWithSubPath:(NSString *)aSubPath parameters:(NSDictionary *)theParameters {
  self = [super init];
  if (self) {
    subPath_ = [aSubPath retain];
    parameters_ = [theParameters retain];
  }
  return self;
}


- (void)dealloc {
  [subPath_ release]; subPath_ = nil;
  [parameters_ release]; parameters_ = nil;
  [super dealloc];
}


- (NSString *)requestUrl {
  
  NSString *url = [NSString stringWithFormat:@"%@/%@", 
                   kAPIBaseUrl,
                   subPath_];
  NSString * parameterStr = [self parametersUrlString];
  if ( parameterStr != nil && [parameterStr length] > 0 ) {
    url = [url stringByAppendingString:parameterStr];
  }
  
  return url;
}


- (NSString *)parametersUrlString {
  NSString *parametersUrl = @"";
  NSUInteger index = 0;
  for (id key in [parameters_ allKeys]) {
    NSString* value = [parameters_ objectForKey:key];
    if (index == 0) {
      parametersUrl = [parametersUrl stringByAppendingFormat:@"?%@=%@", key, value];
    }
    else {
      parametersUrl = [parametersUrl stringByAppendingFormat:@"&%@=%@", key, value];
    }
    ++index;
  }
  return parametersUrl;
}

@end
