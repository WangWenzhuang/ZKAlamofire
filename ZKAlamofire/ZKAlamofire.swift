//
//  ZKAlamofire.swift
//  ZKAlamofire
//
//  Created by 王文壮 on 2017/10/12.
//  Copyright © 2017年 王文壮. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ZKProgressHUD
import JDStatusBarNotification

public enum ZKNetworkReachabilityStatus {
    case notReachable
    case unknown
    case ethernetOrWiFi
    case wwan
}
public typealias ZKAlamofireRequestSuccess = (_ json: JSON) -> Void
public typealias ZKAlamofireRequestFailure = () -> Void
public typealias ZKNetworkReachabilityListener = (_ status: ZKNetworkReachabilityStatus) -> Void
public final class ZKAlamofire {
    public static let requestErrorMsg = "连接服务器失败，请稍后再试"
    private static let notNetworkMsg = "没有网络连接，请稍后再试"
    private static var globalHeaders: HTTPHeaders?
    private static var defaultParameters: [String: Any]?
    private static func request(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure?, method: HTTPMethod, headers: HTTPHeaders? = nil, isShowHUD: Bool = false, encoding: ParameterEncoding =  URLEncoding.default) {
        if ZKAlamofire.isReachable {
            if isShowHUD {
                ZKProgressHUD.show()
            }

            var ps: [String: Any] = [:]
            if let p = parameters {
                for key in p.keys {
                    ps[key] = p[key]
                }
            }
            if let dp = defaultParameters {
                for key in dp.keys {
                    ps[key] = dp[key]
                }
            }
            Alamofire.request(url, method: method, parameters: ps, encoding: encoding, headers: headers ?? self.globalHeaders).responseJSON { (response) in
                if isShowHUD {
                    ZKProgressHUD.dismiss()
                }
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if success != nil {
                        print((response.request!.url?.absoluteString)! + "\t******\tresponse:\r\(json)")
                        success!(json)
                    }
                case .failure(let error):
                    print((response.request!.url?.absoluteString)! + "\t******\terror:\r\(error)")
                    if isShowHUD {
                        ZKProgressHUD.showError(requestErrorMsg)
                    }
                    if failure != nil {
                        failure!()
                    }
                }
            }
        } else {
            JDStatusBarNotification.show(withStatus: notNetworkMsg, dismissAfter: 1.5, styleName: JDStatusBarStyleError)
            if failure != nil {
                failure!()
            }
        }
    }

    // MARK: get
    public static func get(_ url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .get, headers: headers, isShowHUD: false)
    }

    // MARK: get 显示 HUD
    public static func getWithShowHUD(_ url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .get, headers: headers, isShowHUD: true)
    }

    // MARK: post
    public static func post(_ url: String, parameters: [String: Any]?, headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .post, headers: headers, isShowHUD: false, encoding: encoding)
    }

    // MARK: post 显示 HUD
    public static func postWithShowHUD(_ url: String, parameters: [String: Any]?, headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .post, headers: headers, isShowHUD: true, encoding: encoding)
    }

    // MARK: 设置全局 headers
    public static func setGlobalHeaders(_ headers: HTTPHeaders?) {
        self.globalHeaders = headers
    }

    // MARK: 设置默认参数
    public static func setDefaultParameters(_ parameters: [String: Any]?) {
        self.defaultParameters = parameters
    }

    static private var isStartNetworkMonitoring = false
    static private let networkManager = NetworkReachabilityManager(host: "www.baidu.com")!
    // MARK: 网络监视
    public static func startNetworkMonitoring(listener: ZKNetworkReachabilityListener? = nil) {
        networkManager.listener = { status in
            isStartNetworkMonitoring = true
            var zkStatus = ZKNetworkReachabilityStatus.notReachable
            switch status {
            case .notReachable:
                zkStatus = ZKNetworkReachabilityStatus.notReachable
            case .unknown:
                zkStatus = ZKNetworkReachabilityStatus.unknown
            case .reachable(.ethernetOrWiFi):
                zkStatus = ZKNetworkReachabilityStatus.ethernetOrWiFi
            case .reachable(.wwan):
                zkStatus = ZKNetworkReachabilityStatus.wwan
            }
            if listener != nil {
                listener!(zkStatus)
            }
        }
        networkManager.startListening()
    }
    // MARK: 是否联网
    public static var isReachable: Bool {
        get {
            return isStartNetworkMonitoring ? networkManager.isReachable : true
        }
    }
    // MARK: 是否WiFi
    public static var isReachableWiFi: Bool {
        get {
            return networkManager.isReachableOnEthernetOrWiFi
        }
    }
    // MARK: 是否WWAN
    public static var isReachableWWAN: Bool {
        get {
            return networkManager.isReachableOnWWAN
        }
    }
}
