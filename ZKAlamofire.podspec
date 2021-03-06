Pod::Spec.new do |s|
  s.name = 'ZKAlamofire'
  s.version = '3.0'
  s.ios.deployment_target = '8.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = '包含 HUD 的网络请求框架，Alamofire 二次封装'
  s.homepage = 'https://github.com/WangWenzhuang/ZKAlamofire'
  s.authors = { 'WangWenzhuang' => '1020304029@qq.com' }
  s.source = { :git => 'https://github.com/WangWenzhuang/ZKAlamofire.git', :tag => s.version }
  s.description = '将 Alamofire、ZKProgressHUD、SwiftyJSON、ZKStatusBarNotification封装，简化网络请求代码。'
  s.source_files = 'ZKAlamofire/**/*.swift'
  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'ZKProgressHUD'
  s.dependency 'JDStatusBarNotification'
end
