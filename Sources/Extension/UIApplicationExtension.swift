//
//  UIApplicationExtension.swift
//  RSMallShopping
//
//  Created by Thanya on 17/12/20.
//  Copyright © 2020 RS. All rights reserved.
//

import UIKit
import Foundation

extension UIApplication {
    
    public static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController {
        var root = base
        if root == nil {
            root = UIApplication.shared.currentUIWindow()?.rootViewController
        }
        if let nav = root as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = root as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = root?.presentedViewController {
            return topViewController(base: presented)
        }
        return root ?? UIViewController()
    }
    
    public static func rootViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController {
        
        guard let viewController = UIApplication.shared.currentUIWindow()?.rootViewController else {
            return  UIViewController()
        }
        return viewController
    }
    
    public static func viewControllerAlert(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController {
        let top = UIApplication.topViewController()
        if top.tabBarController == nil {
            return top
        }
        return UIApplication.rootViewController()
    }
    
    public static func applicationVersion() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    public static func applicationBuild() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    public static func versionBuild() -> String {
        let version = self.applicationVersion()
        let build = self.applicationBuild()
        return "v.\(version ?? "Unknow")(\(build ?? ""))"
    }
    
    public func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }
        return window
    }
}
