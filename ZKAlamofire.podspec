Pod::Spec.new do |s|
  s.name = 'ZKAlamofire'
  s.version = '1.1'
  s.ios.deployment_target = '8.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = '包含 HUD 的网络请求框架，Alamofire 二次封装'
  s.homepage = 'https://github.com/WangWenzhuang/ZKAlamofire'
  s.authors = { 'WangWenzhuang' => '1020304029@qq.com' }
  s.source = { :git => 'https://github.com/WangWenzhuang/ZKAlamofire.git', :tag => s.version }
  s.description = 'ZKAlamofire 包含 HUD 的网络请求框架，Alamofire 二次封装。'
  s.source_files = 'ZKAlamofire/**/*.swift'
  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
  s.dependency 'ZKLog'
  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'ZKProgressHUD'
  s.dependency 'ZKStatusBarNotification'
end
