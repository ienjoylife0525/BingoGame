//
//  BGGamePageViewController.swift
//  BingoGame
//
//  Created by Patato on 2018/12/4.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation
import UIKit

class BGGamePageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSet()
    }
    
    private func viewSet() {
        self.view.backgroundColor = UIColor.white
        settingBtnSet()
    }
    
    private func settingBtnSet() {
        let settingBtn: UIButton = UIButton()
        settingBtn.frame = CGRect(x: self.view.frame.width/2 - 60, y: 80, width: 120, height: 25)
        settingBtn.layer.borderWidth = 1
        settingBtn.layer.cornerRadius = 10
        settingBtn.setTitle("Game Set", for: .normal)
        settingBtn.setTitleColor(UIColor.darkGray, for: .normal)
        self.view.addSubview(settingBtn)
    }
    
    
    
}

