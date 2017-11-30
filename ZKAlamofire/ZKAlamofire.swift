//
//  ZKAlamofire.swift
//  ZKAlamofire
//
//  Created by 王文壮 on 2017/10/12.
//  Copyright © 2017年 王文壮. All rights reserved.
//

import ZKLog
import Alamofire
import SwiftyJSON
import ZKProgressHUD
import ZKStatusBarNotification

public typealias ZKAlamofireRequestSuccess = (_ json: JSON) -> Void
public typealias ZKAlamofireRequestFailure = () -> Void

public final class ZKAlamofire {
    public static let requestErrorMsg = "连接服务器失败，请稍后再试"
    private static let notNetworkMsg = "没有网络连接，请稍后再试"
    private static var globalHeaders: HTTPHeaders?
    
    private static func request(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure?, method: HTTPMethod, headers: HTTPHeaders? = nil, isShowHUD: Bool = false, encoding: ParameterEncoding =  URLEncoding.default) {
        if ZKAlamofire.isReachable {
            if isShowHUD {
                ZKProgressHUD.show()
            }
            Alamofire.request(url, method: method, parameters: parameters,encoding: encoding, headers: headers ?? self.globalHeaders).responseJSON { (response) in
                if isShowHUD {
                    ZKProgressHUD.dismiss()
                }
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if success != nil {
                        ZKLog.debug((response.request!.url?.absoluteString)! + "\t******\tresponse:\r\(json)")
                        success!(json)
                    }
                case .failure(let error):
                    ZKLog.error((response.request!.url?.absoluteString)! + "\t******\terror:\r\(error)")
                    if isShowHUD {
                        ZKProgressHUD.showError(requestErrorMsg)
                    }
                    if failure != nil {
                        failure!()
                    }
                }
            }
        } else {
            ZKStatusBarNotification.showError(notNetworkMsg)
            if failure != nil {
                failure!()
            }
        }
        
    }
    
    //MARK: get
    public static func get(_ url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .get, headers: headers, isShowHUD: false)
    }
  
    
    //MARK: get 显示 HUD
    public static func getWithShowHUD(_ url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .get, headers: headers, isShowHUD: true)
    }
    
    //MARK: post
    public static func post(_ url: String, parameters: [String: Any]?, headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .post, headers: headers, isShowHUD: false, encoding: encoding)
    }
    
    //MARK: post 显示 HUD
    public static func postWithShowHUD(_ url: String, parameters: [String: Any]?, headers: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure? = nil) {
        request(url, parameters: parameters, success: success, failure: failure, method: .post, headers: headers, isShowHUD: true, encoding: encoding)
    }
    
    //MARK: 设置全局 headers
    public static func setGlobalHeaders(_ headers: HTTPHeaders?) {
        self.globalHeaders = headers
    }
    
    static private var isStartNetworkMonitoring = false
    static private let networkManager = NetworkReachabilityManager(host: "www.baidu.com")!
    //MARK: 网络监视
    public static func startNetworkMonitoring() {
        networkManager.listener = { status in
            isStartNetworkMonitoring = true
            switch status {
            case .notReachable:
                ZKLog.debug("当前网络状态：notReachable")
            case .unknown:
                ZKLog.debug("当前网络状态：Unknown")
            case .reachable(.ethernetOrWiFi):
                ZKLog.debug("当前网络状态：ReachableViaWiFi")
            case .reachable(.wwan):
                ZKLog.debug("当前网络状态：ReachableViaWWAN")
            }
        }
        networkManager.startListening()
    }
    //MARK: 是否联网
    private static var isReachable: Bool {
        get {
            return isStartNetworkMonitoring ? networkManager.isReachable : true
        }
    }
}
