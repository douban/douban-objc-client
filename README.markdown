
[豆瓣 API]: http://www.douban.com

douban-objc-client 
------------------

**douban-objc-client** 是一个 Objective C 实现的 豆瓣 API 客户端。支持 MAC OS 和 ios。

更多信息请查询 **[豆瓣 API]**


如何使用? 
-------

首先，配置 Auth2 所需参数

```objective-c
  [DOUService setAPIKey:kYourAPIKey];
  [DOUService setPrivateKey:kYourPrivateKey];
  [DOUService setRedirectUrl:kYourRedirectUrl];
```


登录，当前只完成了 password 类型的 Auth2 认证

```objective-c
  DOUService *service = [DOUService sharedInstance];
  [service loginWithUsername:kUsernameStr password:kPasswordStr];  
```


发起 一个同步请求

```objective-c
  NSString *subPath = [NSString stringWithFormat:@"/book/subject/%d", bookId];
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"json",@"alt", nil];
  DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:subPath parameters:params] autorelease];

  DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query];
  [service.consumer sign:req];
  
  [req startSynchronous];
  if (![req error]) {
    DoubanEntrySubject *book = [[DoubanEntrySubject alloc] initWithData:[req responseData]];
  }
```


发起 一个异步请求

```objective-c
  NSString *subPath = [NSString stringWithFormat:@"/book/subject/%d", bookId];
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"json",@"alt", nil];
  DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:subPath parameters:params] autorelease];
  
  DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query target:self];

  req.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:startIndex, kUserInfoStartIndex, nil];
  DOUService *service = [DOUService sharedInstance];
  [service addRequest:req];
```


异步请求的回调

```objective-c
- (void)requestFinished:(DOUHttpRequest *)req {
  NSError *error = [req error];
  if (!error) {
    DoubanFeedEvent *feed = [[DoubanFeedEvent alloc] initWithData:[req responseData]];
  }
}

- (void)requestFailed:(DOUHttpRequest *)req {
  NSLog(@"error");
}
```