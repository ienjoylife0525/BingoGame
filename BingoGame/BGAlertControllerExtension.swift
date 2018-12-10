//
//  BGAlertControllerExtension.swift
//  BingoGame
//
//  Created by Patato on 2018/12/10.
//  Copyright © 2018 Patato. All rights reserved.
//

import UIKit

extension UIAlertController {
    func showAlert(message: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: "Alert:Title".localized(), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Alert:Action".localized(), style: .cancel))
        viewController.present(alert, animated: true)
    }
    
    func showConfirmAlert(message: String,
                          in viewController: UIViewController,
                          confirm:@escaping (() -> Void)) {
        let alert = UIAlertController(title: "Alert:Title".localized(), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Alert:Action".localized(), style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            confirm()
        }))
        viewController.present(alert, animated: true)
        
        
        
    }
}
