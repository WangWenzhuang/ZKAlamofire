![(logo)](https://raw.githubusercontent.com/WangWenzhuang/ZKStatusBarNotification/master/image/logo.png)

# ZKStatusBarNotification

![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)
![CocoaPods](https://img.shields.io/badge/pod-v1.1-brightgreen.svg)
![platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)
![contact](https://img.shields.io/badge/contact-1020304029%40qq.com-brightgreen.svg)

可以在 iOS App 状态栏很容易的显示消息通知。

![error](https://raw.githubusercontent.com/WangWenzhuang/ZKStatusBarNotification/master/image/error.jpeg)
![info](https://raw.githubusercontent.com/WangWenzhuang/ZKStatusBarNotification/master/image/info.jpeg)
![info](https://raw.githubusercontent.com/WangWenzhuang/ZKStatusBarNotification/master/image/success.jpeg)

## 实现功能

- [x] 显示情景消息
- [x] 自定义（情景背景色、字体颜色、字体、自动消失间隔秒）

## 运行环境

* iOS 8.0 +
* Xcode 8 +
* Swift 3.0 +

## 安装

### CocoaPods

你可以使用 [CocoaPods](http://cocoapods.org/) 安装 `ZKStatusBarNotification`，在你的 `Podfile` 中添加：

```ogdl
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'ZKStatusBarNotification'
end
```
### 手动安装

* 拖动 `ZKStatusBarNotification` 文件夹到您的项目

## 快速使用

### 导入 `ZKStatusBarNotification`

```swift
import ZKStatusBarNotification
```

### 显示情景 -> 信息

```swift
ZKStatusBarNotification.showInfo("Star 一下吧")
```

### 显示情景 -> 成功

```swift
ZKStatusBarNotification.showSuccess("操作成功")
```

### 显示情景 -> 错误

```swift
ZKStatusBarNotification.showError("出现错误了")
```

## 自定义显示样式

### 设置字体

```swift
ZKStatusBarNotification.setFont(_ font: UIFont)
```

### 设置字体颜色

```swift
ZKStatusBarNotification.setTextColor(_ color: UIColor)
```

### 设置情景 -> 信息背景颜色

```swift
ZKStatusBarNotification.setInfoBackgroundColor(_ color: UIColor)
```

### 设置情景 -> 出错背景颜色

```swift
ZKStatusBarNotification.setErrorBackgroundColor(_ color: UIColor)
```

### 设置情景 -> 成功背景颜色

```swift
ZKStatusBarNotification.setErrorBackgroundColor(_ color: UIColor)
```

### 设置自动隐藏时间

```swift
ZKStatusBarNotification.setAutoDismissDelay(_ delay: Int)
```
