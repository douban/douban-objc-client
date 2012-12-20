
[豆瓣 API]: http://developers.douban.com/

# douban-objc-client 介绍

**douban-objc-client** 是一个 Objective C 实现的 豆瓣 API 客户端。现在仅支持 iOS。

更多信息请查询 **[豆瓣 API]**


# 如何配置?

## 方法一：项目依赖
#### *适用于开发过程中可能会修改 douban-objc-client 的源代码的项目

### 1.DoubanAPIEngine

将`DoubanAPIEngine.xcodeproj`图标拖拽到你的项目文件目录中。

### 2.设置项目 Building Settings

点击 `项目` -> `(TARGETS)` 图标，在 `Build Settings` 里找到 `Other Linker Flags`, 设置为 `-all_load`, 和 `-ObjC`

### 3.设置目标 Building Settings

同上，找到 Header Search Paths，添加

* ../DoubanAPIEngine/DoubanAPIEngine/OtherSources
* ../DoubanAPIEngine/DoubanAPIEngine/Sources
* ${SDK_DIR}/usr/include/libxml2

##### TIPS :
以上的两个**DoubanAPIEngine**的目录可以是相对目录也可以是绝对目录，需要自行配置。这里将DoubanAPIEngine目录直接拷贝到了项目目录下。建议如此使用，有助于移植。


### 4.添加依赖

点击目标(TARGETS)图标，选择 `Building Phases`，找到 `Target Dependencies`，添加 `DoubanAPIEngine`。


### 5.添加所需的 Frameworks

点击目标(TARGETS)图标，选择 `Building Phases`，在 `Link Binary with Libaries` 中，加入下列库：

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

#### Tips : 此方法 import 头文件应该使用以下方式:

	#import "DOUService.h"

## 方法二：添加 framework
#### *适用于不会修改源代码的项目

### 1.添加 libDoubanAPIEngine.framework
点击目标(TARGETS)图标，选择Building Phases，在Link Binary with Libaries中，加入 libDoubanAPIEngine.framework

### 2.设置项目 Building Settings
点击 `项目` -> `(TARGETS)` 图标，在 `Build Settings` 里找到 `Other Linker Flags`, 设置为 `-all_load`, 和 `-ObjC`

### 3.添加其他库
点击目标(TARGETS)图标，选择Building Phases，在Link Binary with Libaries中，加入

  * libxml2.dylib
  * libz.dylib
  * CoreGraphics.framework
  * CFNetwork.framework
  * Security.framework
  * SystemConfiguration.framework
  * MobileCoreServices.framework
  * UIKit.framework
  * Foundation.framework

#### Tips : 此方法 import 头文件应该使用以下方式:

	#import <libDoubanAPIEngine/DOUService.h>


# 如何使用?


### 1.提供 OAuth2 所需参数

 	DOUService *service = [DOUService sharedInstance];
 	service.clientId = kAPIKey;
 	service.clientSecret = kPrivateKey;

### 2.发起一个异步请求

	NSString *subPath = [NSString stringWithFormat:@"/book/subject/%d", bookId];
	DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:subPath parameters:nil] autorelease];
  
	query.apiBaseUrlString = service.apiBaseUrlString;
	DOUHttpRequest *req = [DOUHttpRequest requestWithQuery:query target:self];

	DOUService *service = [DOUService sharedInstance];
	[service addRequest:req];


若使用 delegate 方式处理回调，要注意一个问题，某些情况下，request 的 delegate 被 dealloc 后，request 才得到了返回。这时就是一个 已释放的 delegate 来处理回调。
这会造成程序崩溃。处理方法为，在 request 的 delegate (例如某个 UIViewController) 的 dealloc 方法中对 request 发送 clearDelegatesAndCancel 消息，再 release request。

另外一个更为优雅的方法是使用“闭包” (block)，DOUHttpRequest 提供了一个方法，可以用闭包来处理回调。由于 request 会自动 retain 闭包。所以，这就避免了使用 delegate 处理回调时可能出现的上述问题。

但， Objective－C 的闭包在 iOS 4.0 及其以上版本才得到支持。

DOUHttpRequest 的闭包处理回调的方法：

	+ (DOUHttpRequest *)requestWithQuery:(DOUQuery *)query 
    	                 completionBlock:(DOUBasicBlock)completionHandler;

### 3.异步请求的回调

	- (void)requestFinished:(DOUHttpRequest *)req {
  		NSError *error = [req error];
  		if (!error) {
    		DoubanFeedEvent *feed = [[DoubanFeedEvent alloc] initWithData:[req responseData]];
  		}
	}

	- (void)requestFailed:(DOUHttpRequest *)req {
  		NSLog(@"error");
	}


# 待办列表
  * 提供更多数据类型的支持，如: 豆邮，日记，收藏
  * 支持 Mac OSX
  * 改进 token 过期时，refresh token 的方式，使其不依赖于本机时间
  * ARC, no-ARC 双模支持
