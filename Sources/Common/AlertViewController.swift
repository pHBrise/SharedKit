//
//  AlertViewController.swift
//  ULife
//
//  Created by Phanvit Chevamongkolnimit on 3/5/2566 BE.
//

import UIKit
import ExtensionKit

enum AlertStyle {
    case normal
    case warning
}

open class AlertViewController: BaseViewController {
    
    @IBOutlet weak var tranparentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    var style:AlertStyle = .normal
    
    var doNotClose = false
    var isShowCloseButton = false
    
    var confirmHandle: (() -> Void)?
    var cancelHandle: (() -> Void)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        accessibilityLabel = "Alert View"
        titleLabel.font = UIFont.kanitRegular(ofSize: 20)
        messageLabel.font = UIFont.kanitRegular(ofSize: 16)
        cancelButton.titleLabel?.font = UIFont.kanitRegular(ofSize: 16)
        confirmButton.titleLabel?.font = UIFont.kanitRegular(ofSize: 16)
        switch style {
        case .normal:
            confirmButton.backgroundColor = .ulifePurple
            confirmButton.setTitleColor(.white, for: .normal)
        case .warning:
            confirmButton.borderColor = .redText
            confirmButton.borderWidth = 1
            confirmButton.backgroundColor = .white
            confirmButton.setTitleColor(.redText, for: .normal)
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.tranparentView.alpha = 0.8
        })
    }

    func show(viewController: UIViewController = UIApplication.viewControllerAlert(), title: String, subTitle: String? = nil, confirmButton: Bool = true, confrimTitle: String = "confirm".localize() , cancelButton: Bool = true, cancelTitle: String = "cancel".localize(), confirm confirmHandle: (() -> Void)? = nil, cancel cancelHandle: (() -> Void)? = nil, notClose: Bool = false, showClose: Bool = false) {
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        viewController.present(self, animated: false, completion: { [weak self] in
            self?.titleLabel.text = title
            self?.doNotClose = notClose
            self?.confirmButton.setTitle(confrimTitle, for: .normal)
            self?.cancelButton.setTitle(cancelTitle, for: .normal)
            self?.confirmButton.isHidden = !confirmButton
            self?.cancelButton.isHidden = !cancelButton
            
            self?.confirmHandle = confirmHandle
            self?.cancelHandle = cancelHandle
            
            if let subText = subTitle {
                self?.messageLabel.text = subText
            } else {
                self?.messageLabel.isHidden = true
            }
            
            if self?.confirmButton.isHidden ?? false, self?.cancelButton.isHidden ?? false {
                self?.buttonView.isHidden = true
                self?.autoDismiss()
            }
            self?.closeButton.isHidden = !showClose
            self?.isShowCloseButton = showClose
            UIView.animate(withDuration: 0.2, animations: {
                self?.alertView.alpha = 1
            })
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !doNotClose {
            if self.confirmButton.isHidden, self.cancelButton.isHidden {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func autoDismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        if doNotClose {
            confirmHandle?()
        } else {
            self.dismiss(animated: true, completion: confirmHandle)
        }
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            if self.isShowCloseButton {
                self.confirmHandle?()
            } else {
                self.cancelHandle?()
            }
        }
    }
    
    @IBAction func confirmButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        cancelHandle?()
    }
}
