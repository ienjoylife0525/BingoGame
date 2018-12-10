//
//  BGAlertControllerExtension.swift
//  BingoGame
//
//  Created by Patato on 2018/12/10.
//  Copyright © 2018 Patato. All rights reserved.
//

import UIKit

extension UIAlertController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert:Title".localized(), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Alert:Action".localized(), style: .cancel))
        currentVC().present(alert, animated: true)
    }
    
    func showConfirmAlert(message: String, confirm:@escaping (() -> Void)) {
        let alert = UIAlertController(title: "Alert:Title".localized(), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Alert:Cancel".localized(), style: .cancel))
        alert.addAction(UIAlertAction(title: "Alert:Action".localized(), style: .default, handler: { (_) in
            confirm()
        }))
        currentVC().present(alert, animated: true)
        
    }
    
    func currentVC() -> UIViewController {
        var top = UIApplication.shared.keyWindow?.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top!
    }
    
    
    
}
