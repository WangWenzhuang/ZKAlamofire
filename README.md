![(logo)](https://raw.githubusercontent.com/WangWenzhuang/ZKAlamofire/master/images/logo.png)

# ZKAlamofire

![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)
![build](https://travis-ci.org/WangWenzhuang/ZKAlamofir.svg?branch=master)
![CocoaPods](https://img.shields.io/badge/pod-v2.0-brightgreen.svg)
![platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)

将 [Alamofire](https://github.com/Alamofire/Alamofire)、[ZKProgressHUD](https://github.com/WangWenzhuang/ZKProgressHUD)、[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)、[ZKStatusBarNotification](https://github.com/WangWenzhuang/ZKStatusBarNotification) 封装，简化网络请求代码

## 实现功能

- [x] 网络环境监控
- [x] post、get
- [x] HUD 方式 post、get
- [x] 设置全局 header

## 运行环境

* iOS 8.0 +
* Xcode 8 +
* Swift 4.0 +

## 安装

### CocoaPods

你可以使用 [CocoaPods](http://cocoapods.org/) 安装 `ZKAlamofire`，在你的 `Podfile` 中添加：

```ogdl
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'ZKAlamofire'
end
```

## 快速使用

-> ZKAlamofireRequestSuccess 中的 **json** 参数为 **SwiftyJSON**；在调用 get、getWithShowHUD、post、postWithShowHUD 中的参数大多数可以不填写，如果不需要设置此参数则可以删除此参数或者传 **nil**

### 导入 `ZKAlamofire`

```swift
import ZKAlamofire
```

### 网络监控

```swift
ZKAlamofire.startNetworkMonitoring()
```

打开网络监控之后，在使用 ZKAlamofire 请求时如果没有网络连接，会提示如下图

![(img1)](https://raw.githubusercontent.com/WangWenzhuang/ZKAlamofire/master/images/error.jpg)

### Get 请求

不显示加载

```swift
ZKAlamofire.get("url", success: (json) in
    // 回调代码
}
```

显示加载

```swift
ZKAlamofire.getWithShowHUD("url", success: (json) in
    // 回调代码
}
```

### Post 请求

不显示加载

```swift
ZKAlamofire.post("url", parameters: nil, success: (json) in
    // 回调代码
}
```

显示加载

```swift
ZKAlamofire.postWithShowHUD("url", parameters: nil, success: (json) in
    // 回调代码
}
```

### 设置全局 Header

```swift
ZKAlamofire.setGlobalHeaders(["key": "value"])
```

### 自定义 HUD 样式

自定义需要引用 [ZKProgressHUD](https://github.com/WangWenzhuang/ZKProgressHUD) ，之后设置其样式即可