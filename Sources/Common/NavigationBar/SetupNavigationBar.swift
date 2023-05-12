//
//  Navigation.swift
//  RSMallShopping
//
//  Created by Mungkorn Satayavirut on 13/11/2563 BE.
//

import UIKit

public protocol NavigationActionHandleProtocol {
    func backClickAction()
    func openSettingClickAction()
    func openSearchClickAction()
}

extension BaseViewController: NavigationActionHandleProtocol {
    
     public enum NavigationType {
        case logo
        case flashSale
        case title
        case search
    }

    public enum NavigationRightItem {
        case cart
        case search
        case close
        case wishlist
        case setting
        case noti
        case profile

        var image: UIImage? {
            switch self {
            case .cart:
                return UIImage(named: "cart_nav_icon", in: .module, compatibleWith: nil)
            case .search:
                return UIImage(named: "cart_nav_icon", in: .module, compatibleWith: nil)
            case .close:
                return UIImage(named: "default_close", in: .module, compatibleWith: nil)
            case .wishlist:
                return UIImage(named: "cart_nav_icon", in: .module, compatibleWith: nil)
            case .setting:
                return UIImage(named: "setting_nav_icon", in: .module, compatibleWith: nil)
            case .noti:
                return UIImage(named: "noti_nav_icon", in: .module, compatibleWith: nil)
            case .profile:
                return UIImage(named: "mack_nav_profile", in: .module, compatibleWith: nil)
            }
        }

    }

    public func setupNavigationBar(_ type: NavigationType = .logo,barColor: UIColor = .clear, backButton: Bool = false, notiButton: Bool = false, rightItem: [NavigationRightItem] = []) {
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
        
        setupNavigationBarColor(barColor)
        
        switch type {
        case .logo:
            setupNavigationBarItemsLogoType()
        case .flashSale:
            setupNavigationBarItemsFlashSaleType()
        case .search:
            setupNavigationSearchBarType()
        default: break
        }
        setupRightNavigationBar(rightItem)

        if notiButton {
            setupLeftNavigationBarNoti()
        }
        if backButton {
            setupBackNavigationBar()
        }
    }
    
    private func setupNavigationBarColor(_ barColor: UIColor) {
        navigationController?.navigationBar.backgroundColor = barColor
        navigationController?.navigationBar.isTranslucent = barColor == .clear
        navigationController?.navigationBar.tintColor = .blackText
        navigationController?.navigationBar.barTintColor = barColor
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.blackText,
         NSAttributedString.Key.font: UIFont.kanitRegular(ofSize: 20) ]
        navigationController?.delegate = self
    }
    
    func hiddenNavigationBarItemsLogoType() {
        guard let logo = logoImageView else {
            return
        }
        logo.isHidden = true
    }
    private func setupNavigationBarItemsLogoType() {
        guard let logo = logoImageView else {
            let logoImage = UIImage(named: "logo_nav_icon", in: .module, compatibleWith: nil)
            logoImageView = UIImageView(image: logoImage)
            logoImageView.frame = CGRect(x:0,y:0, width:60,height:21)
            logoImageView.contentMode = .scaleAspectFit
            let imageItem = UIBarButtonItem(customView: logoImageView)
            navigationItem.leftBarButtonItems = [imageItem]
            return
        }
        logo.isHidden = false

    }
    
    private func setupNavigationBarItemsFlashSaleType() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "nav_flashsale_logo", in: .module, compatibleWith: nil))
        setupLeftNavigationBarBack()
        //        setupRightNavigationBarCart()
    }
    
    private func setupNavigationSearchBarType() {
        //        navigationItem.titleView = UIView(frame: CGRect(x: -20, y: 0, width: UIScreen.main.bounds.width-100, height: 36))
        setupLeftNavigationBarBack()
    }
    
    private func setupNavigationBarItemsTitleType() {
        setupLeftNavigationBarBack()
        //        setupRightNavigationBarCart()
    }
    
    private func setupNavigationBarItemsTitleNoBackType() {
        //        setupLeftNavigationBarNoti()
        //        setupRightNavigationBarCart()
    }
    
    private func setupLeftNavigationBarNoti() {
        let notificationButton = UIButton(type: .system)
        notificationButton.setImage(UIImage.packageResource(named: "IconNofication"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }

    private func setupLeftNavigationBarBack() {
        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage.packageResource(named: "leftback_icon"), style: .plain, target: nil, action: nil)
    }
    
    private func setupBackNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.packageResource(named: "leftback_icon"), style: .plain, target: self, action: #selector(back))
    }

    func setupRightNavigationBar(_ items: [NavigationRightItem]) {

        var barButtonItems: [UIView] = []
        items.forEach { (item) in

            switch item {
            case .close:
                let barItem =  UIButton()
                barItem.setImage(item.image, for: .normal)
                barItem.addTarget(self, action:#selector(closeClickAction) , for:.touchUpInside)
                barButtonItems.append(barItem)
            case .cart:
                let button = BadgeButton()
                button.badge = "10"
                button.setImage(item.image, for: .normal)
                barButtonItems.append(button)
                    return
            case .search:
                let barItem =  UIButton()
                barItem.setImage(item.image, for: .normal)
                barItem.addTarget(self, action:#selector(openSearchClickAction) ,for:.touchUpInside)
                barButtonItems.append(barItem)
            case .setting:
                let barItem =  UIButton()
                barItem.setImage(item.image, for: .normal)
                barItem.addTarget(self, action:#selector(openSettingClickAction) ,for:.touchUpInside)
                barButtonItems.append(barItem)
            case .noti:
                let button = BadgeButton()
                button.badge = "2"
                button.setImage(item.image, for: .normal)
                barButtonItems.append(button)
            case .profile:
                    let barItem = UIImageView(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
                    barItem.image = item.image
                    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleProfileTap(_:)))
                    barItem.addGestureRecognizer(tap)
                    barItem.layer.masksToBounds = false
                    barItem.layer.cornerRadius = barItem.frame.height/2
                    barItem.clipsToBounds = true
                    barButtonItems.append(barItem)

            default:
                let barItem =  UIButton()
                barItem.setImage(item.image, for: .normal)
                barItem.addTarget(self, action:#selector(openSettingClickAction) ,for:.touchUpInside)
                barButtonItems.append(barItem)
            }
        }

        navigationBarItems = UIStackView(arrangedSubviews: barButtonItems)
        navigationBarItems?.distribution = .equalSpacing
        navigationBarItems?.axis = .horizontal
        navigationBarItems?.alignment = .center
        navigationBarItems?.spacing = 20
        
        let rightBarButton = UIBarButtonItem(customView: navigationBarItems!)
        navigationItem.rightBarButtonItem = rightBarButton

    }

    @objc public func backClickAction() {
        backClickAction()
    }

    @objc public func openSearchClickAction() {
        openSearchClickAction()
    }
    
    @objc public func openSettingClickAction() {
        openSettingClickAction()
    }
    
    @objc public func closeClickAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func back() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: false, completion: nil)
    }

    @objc func handleProfileTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
    }

}

extension UIViewController: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: String(), style: .plain, target: nil, action: nil)
    }
}
