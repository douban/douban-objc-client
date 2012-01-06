
[豆瓣 API]: http://www.douban.com/service/

douban-objc-client 
------------------

**douban-objc-client** 是一个 Objective C 实现的 豆瓣 API 客户端。支持 MAC OS 和 ios。

更多信息请查询 **[豆瓣 API]**


如何使用? 
-------
* 首先配置所需的 Frameworks，将下面库加入你的项目的 Link Binary with Libaries
  * libDoubanAPIEngine.a
  * libxml2.dylib
  * libz.dylib
  * CoreGraphics.framework
  * CFNetwork.framework
  * Security.framework
  * SystemConfiguration.framework
  * MobileCoreServices.framework
  * UIKit.framework
  * Foundation.framework
  * SenTestingkit.framework


* 设置工程 Building Settings
找到 Other Linker Flags, 设置为 －all_load 和 －Objc


* 提供 Auth2 所需参数

```objective-c
  [DOUService setAPIKey:kYourAPIKey];
  [DOUService setPrivateKey:kYourPrivateKey];
  [DOUService setRedirectUrl:kYourRedirectUrl];
```


* 登录，当前只完成了 password 类型的 Auth2 认证，随后会支持 AuthorizationCode 类型认证

```objective-c
  DOUService *service = [DOUService sharedInstance];
  [service loginWithUsername:kUsernameStr password:kPasswordStr];  
```


* 发起一个同步请求

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


* 发起一个异步请求

```objective-c
  NSString *subPath = [NSString stringWithFormat:@"/book/subject/%d", bookId];
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"json",@"alt", nil];
  DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:subPath parameters:params] autorelease];
  
  DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query target:self];

  req.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:startIndex, kUserInfoStartIndex, nil];
  DOUService *service = [DOUService sharedInstance];
  [service addRequest:req];
```


* 异步请求的回调

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