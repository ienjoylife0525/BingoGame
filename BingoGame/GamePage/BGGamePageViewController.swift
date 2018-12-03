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
        self.title = "Game Page"
        settingBtnSet()
    }
    
    private func settingBtnSet() {
        let settingBtn = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = settingBtn
    }
    
    private func borderViewSet() {
        
    }
    
}

