![(logo)](https://raw.githubusercontent.com/WangWenzhuang/ZKLog/master/logo.png)

# ZKLog

![build](https://travis-ci.org/WangWenzhuang/ZKLog.svg?branch=master)
![CocoaPods](https://img.shields.io/badge/pod-v1.0-brightgreen.svg)
![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)
![platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)

## 实现功能

- [x] 情景日志输出 
- [x] 自定义日志前缀

## 运行环境

* iOS 8.0 +
* Xcode 8 +
* Swift 4.0 +

## 安装

### CocoaPods

你可以使用 [CocoaPods](http://cocoapods.org/) 安装 `ZKProgressHUD`，在你的 `Podfile` 中添加：

```ogdl
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'ZKLog'
end
```

## 快速使用

### 导入 `ZKLog`

```swift
import ZKLog
```

使用

```swift
ZKLog.verbose("verbose")
ZKLog.debug("debug")
ZKLog.info("info")
ZKLog.warn("warn")
ZKLog.error("error")
```

输出

[verbose] - 16:39:15.460:	verbose

[debug] - 16:39:15.471:	debug

[info] - 16:39:15.471:	info

[warn] - 16:39:15.471:	warn

[error] - 16:39:15.471:	error