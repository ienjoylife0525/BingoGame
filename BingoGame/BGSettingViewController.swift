//
//  BGSettingViewController.swift
//  BingoGame
//
//  Created by Patato on 2018/12/4.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation
import UIKit

class BGSettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func viewSet() {
        self.navigationItem.title = "Game Set"
        self.view.backgroundColor = UIColor.white
        sizeTextFieldSet()
    }
    
    private func sizeTextFieldSet() {
        let m_txfSize = UITextField.init(frame: CGRect(x: 30, y: 50, width: self.view.frame.width - 20, height: 50))
        m_txfSize.placeholder = "Please enter size"
        m_txfSize.borderStyle = .roundedRect
        m_txfSize.keyboardType = .numberPad
        self.view.addSubview(m_txfSize)
    }
}
