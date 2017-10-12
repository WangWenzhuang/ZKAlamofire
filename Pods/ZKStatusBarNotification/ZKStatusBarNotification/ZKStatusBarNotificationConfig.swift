//
//  ZKStatusBarNotificationConfig.swift
//  ZKStatusBarNotification
//
//  Created by 王文壮 on 2017/4/28.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import UIKit

class ZKStatusBarNotificationConfig {
    static var font: UIFont = UIFont.boldSystemFont(ofSize: 13)
    static var textColor: UIColor = .white
    static var autoDismissDelay: Int = 2
    static var infoBackgroundColor: UIColor = UIColor(red: 49 / 255.0, green: 176 / 255.0, blue: 213 / 255.0, alpha: 1.0)
    static var errorBackgroundColor: UIColor = UIColor(red: 152 / 255.0, green: 34 / 255.0, blue: 6 / 255.0, alpha: 1.0)
    static var successBackgroundColor: UIColor = UIColor(red: 68 / 255.0, green: 157 / 255.0, blue: 68 / 255.0, alpha: 1.0)
}
typealias Config = ZKStatusBarNotificationConfig
