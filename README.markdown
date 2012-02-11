
[豆瓣 API]: http://www.douban.com/service/

douban-objc-client 介绍
----------------------

**douban-objc-client** 是一个 Objective C 实现的 豆瓣 API 客户端。支持 MAC OS 和 ios。

更多信息请查询 **[豆瓣 API]**



如何配置? 
-------

* 包含 DoubanAPIEngine

将 DoubanAPIEngine.xcodeproj 图标拖拽到你的项目文件目录中。


* 设置项目 Building Settings

点击项目(TARGETS) 图标，找到 Other Linker Flags, 设置为 -all_load -ObjC


* 设置目标 Building Settings

点击目标(TARGETS)图标，找到 Header Search Paths，添加 DoubanAPIEngine/OtherSources，DoubanAPIEngine/Sources 以及 ${SDK_DIR}/usr/include/libxml2 。

DoubanAPIEngine/OtherSources， DoubanAPIEngine/Sources，可为相对目录，这样有助于移植。例如，你的项目若和 douban-objc-client 文件夹在同一目录下， 就可添加 ../douban-objc-client/DoubanAPIEngine/DoubanAPIEngine/OtherSources 和 ../douban-objc-client/DoubanAPIEngine/DoubanAPIEngine/Sources 。并且勾选 Recursive。


* 添加依赖

点击目标(TARGETS)图标，选择 Building Phases，在 Target Dependencies 中，添加 DoubanAPIEngine。


* 配置所需的 Frameworks

点击目标(TARGETS)图标，选择 Building Phases，在 Link Binary with Libaries 中，加入下列库：

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



如何使用? 
-------

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
  DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:subPath parameters:nil] autorelease];
  
  DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query target:self];

  DOUService *service = [DOUService sharedInstance];
  [service addRequest:req];
```

若使用 delegate 方式处理回调，要注意一个问题，某些情况下，request 的 delegate 被 dealloc 后，request 才得到了返回。这时就是一个 已释放的 delegate 来处理回调。
这会造成程序崩溃。处理方法为，在 request 的 delegate (例如某个 UIViewController) 的 dealloc 方法中对 request 发送 clearDelegatesAndCancel 消息，再 release request。

另外一个更为优雅的方法是使用“闭包” (block)，DOUHttpRequest 提供了一个方法，可以用闭包来处理回调。由于 request 会自动 retain 闭包。所以，这就避免了使用 delegate 处理回调时可能出现的上述问题。

但， Objective－C 的闭包在 iOS 4.0 及其以上版本才得到支持。

DOUHttpRequest 的闭包处理回调的方法：

```objective-c
+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query 
                     completionBlock:(DOUBasicBlock)completionHandler;
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



待办列表
-------
  * 提供 AuthorizationCode 类型的 Auth2 认证的支持        
  * 提供更多数据类型的支持，如: 豆邮，日记，收藏
  * 改进 token 过期时，refresh token 的方式，使其不依赖于本机时间

