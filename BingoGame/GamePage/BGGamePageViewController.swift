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
    
    var m_btnSetting: UIBarButtonItem?
    var m_lbStatus: UILabel?
    var m_vBorder: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSet()
        bindUI()
    }
    
    private func bindUI() {
        m_btnSetting?.action = #selector(self.clickSetting)
        
    }
    
    
    // UI Drawing
    private func viewSet() {
        self.view.backgroundColor = UIColor.white
        self.title = "Game Page"
        settingBtnSet()
        borderViewSet()
        statusLabelSet()
    }
    
    private func settingBtnSet() {
        m_btnSetting = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = m_btnSetting
    }
    
    private func statusLabelSet() {
        m_lbStatus = UILabel(frame: CGRect(x: 10, y: 100, width: self.view.frame.width - 30, height: 40))
        m_lbStatus!.text = "Set the game first !!"
        m_lbStatus!.textColor = UIColor.darkGray
        self.view.addSubview(m_lbStatus!)
    }
    private func borderViewSet() {
        m_vBorder = UIView(frame: CGRect(x: 10, y: 180, width: self.view.frame.width - 20, height: self.view.frame.width - 20))
        m_vBorder!.backgroundColor = UIColor.gray
        self.view.addSubview(m_vBorder!)
        
    }
    
    // Function
    @objc private func clickSetting() {
        let m_vcSetPage = BGSettingViewController()
        self.navigationController?.pushViewController(m_vcSetPage, animated: true)
        
    }
    
}

