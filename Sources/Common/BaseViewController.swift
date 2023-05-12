//
//  BaseViewController.swift
//  ULife
//
//  Created by Thanya on 17/12/20.
//  Copyright © 2020 RS. All rights reserved.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
    var logoImageView: UIImageView!
    var navigationBarItems: UIStackView?

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = " "
    }

    var isShowNavBar = false {
        didSet {
            if let navigationController = navigationController {
                navigationController.setNavigationBarHidden(!isShowNavBar, animated: true)
            }
        }
    }
    
//    public func displayAlert(viewController: UIViewController? = nil,title: String, subTitle: String? = nil, confirmButton: Bool = true, cancelBuuton: Bool = false, confirmTitle: String = "accept".localize(), cancelTitle: String = "confirm".localize(), showCloseButton: Bool = false , confirmHandle: (() -> Void)? = nil, cancelHandle: (() -> Void)? = nil ){
//        let alertView = AlertViewController()
//        let _viewController = viewController == nil ? UIApplication.viewControllerAlert():viewController!
//        alertView.show(viewController: _viewController , title: title, subTitle: subTitle, confirmButton: confirmButton, confrimTitle: confirmTitle, cancelButton: cancelBuuton, cancelTitle: cancelTitle, confirm: confirmHandle, cancel: cancelHandle, notClose: false, showClose: showCloseButton)
//    }
//
//    func displayRedAlert(title: String, subTitle: String? = nil, confirmTitle: String = "confirm".localize(),showCloseButton: Bool = false, cancelHandle: (() -> Void)? = nil, confirmHandle: (() -> Void)? = nil ){
//        let alertView = AlertViewController()
//        alertView.show(viewController: UIApplication.viewControllerAlert() , title: title, subTitle: subTitle, confirmButton: false, cancelButton: true, cancelTitle: confirmTitle, confirm: confirmHandle, cancel: cancelHandle, notClose: false, showClose: showCloseButton )
//    }
//
//    func displayError(error: RSDisplayError, retyyButton: String = "retry".localize(),showCloseButton: Bool = false, cancelHandle: (() -> Void)? = nil, retryHandle: (() -> Void)? = nil ){
//        let alertView = AlertViewController()
//        alertView.show(viewController: UIApplication.viewControllerAlert() , title: error.title, subTitle: error.subTitle, confirmButton: false, cancelButton: true, cancelTitle: retyyButton, confirm: retryHandle, cancel: cancelHandle, notClose: false, showClose: showCloseButton )
//    }
//
//    func showSkeletonView(views: [UIView] = []) {
//        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topLeftBottomRight)
//        if views.isEmpty {
//            view.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .defaultBackgroundColor), animation: animation, transition: .crossDissolve(0.25))
//            return
//        }
//
//        views.forEach { sView in
//            sView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .defaultBackgroundColor), animation: animation, transition: .crossDissolve(0.25))
//        }
//    }
//
//    func hideSkeletonView(views: [UIView] = []) {
//        if views.isEmpty {
//            view.hideSkeleton(transition: .crossDissolve(0.25))
//            return
//        }
//        views.forEach { sView in
//            sView.hideSkeleton(transition: .crossDissolve(0.25))
//
//        }
//
//    }
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    open override func viewDidLayoutSubviews() {
//        view.layoutSkeletonIfNeeded()
    }
}
