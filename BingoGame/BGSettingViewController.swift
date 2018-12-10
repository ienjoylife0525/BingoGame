//
//  BGSettingViewController.swift
//  BingoGame
//
//  Created by Patato on 2018/12/4.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation
import UIKit

class BGSettingViewController: UIViewController, UITextFieldDelegate {
    
    
    // UI
    var m_txfSize: UITextField?
    var m_txfGoal: UITextField?
    var m_txfMin: UITextField?
    var m_txfMax: UITextField?
    var m_btnSubmit: UIButton?
    var m_lbMaxTitle: UILabel?
    var m_lbMinTitle: UILabel?
    
    // Delegate
    weak var setDelegate: GameSettingDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSet()
        m_txfSize?.delegate = self
        m_txfGoal?.delegate = self
        m_txfMin?.delegate = self
        m_txfMax?.delegate = self
        self.m_btnSubmit?.addTarget(self, action: #selector(self.clickSubmit), for: .touchUpInside)
    }
    
    private func viewSet() {
        self.navigationItem.title = "Text:SetPage".localized()
        self.view.backgroundColor = UIColor.white
        sizeTextFieldSet()
        sizeTitleSet()
        goalTitleSet()
        goalTextFieldSet()
        minTitleSet()
        minTextFieldSet()
        maxTitleSet()
        maxTextFieldSet()
        submitBtnSet()
        //Constraint
        maxTitleConstraint()
        maxTextFieldConstraint()
        minTitleConstraint()
        minTextFieldConstraint()
    }
    
    private func sizeTitleSet() {
        let m_lbSizeTitle = UILabel.init(frame: CGRect(x: 30, y: 95, width: 300, height: 40))
        m_lbSizeTitle.text = "Text:SizeInput".localized()
        m_lbSizeTitle.textColor = UIColor.rgb(kCQueenBlue)
        self.view.addSubview(m_lbSizeTitle)
    }
    
    private func sizeTextFieldSet() {
        m_txfSize = UITextField.init(frame: CGRect(x: 30, y: 140, width: self.view.frame.width - 80, height: 40))
        m_txfSize!.placeholder = "Text:SizeHolder".localized()
        m_txfSize!.borderStyle = .roundedRect
        m_txfSize!.keyboardType = .numberPad
        m_txfSize!.returnKeyType = .done
        self.view.addSubview(m_txfSize!)
    }
    
    private func goalTitleSet() {
        let m_lbGoalTitle = UILabel.init(frame: CGRect(x: 30, y: 200, width: self.view.frame.width - 80, height: 40))
        m_lbGoalTitle.text = "Text:GoalInput".localized()
        m_lbGoalTitle.textColor = UIColor.rgb(kCQueenBlue)
        self.view.addSubview(m_lbGoalTitle)
    }
    
    private func goalTextFieldSet() {
        m_txfGoal = UITextField.init(frame: CGRect(x: 30, y: 245, width: self.view.frame.width - 80 , height: 40))
        m_txfGoal!.placeholder = "Text:GoalHolder".localized()
        m_txfGoal!.borderStyle = .roundedRect
        m_txfGoal!.keyboardType = .numberPad
        m_txfGoal!.returnKeyType = .done
        self.view.addSubview(m_txfGoal!)
        
    }
    
    private func minTitleSet() {
        m_lbMinTitle = UILabel()
        m_lbMinTitle!.text = "Text:Min".localized()
        m_lbMinTitle!.textColor = UIColor.rgb(kCQueenBlue)
        self.view.addSubview(m_lbMinTitle!)
        m_lbMinTitle?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func minTitleConstraint() {
        let leading = NSLayoutConstraint(item: m_lbMinTitle!, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 30)
        let trailing = NSLayoutConstraint(item: m_lbMinTitle!, attribute: .trailing, relatedBy: .equal, toItem: m_txfMin, attribute: .leading, multiplier: 1, constant: -10)
        let top = NSLayoutConstraint(item: m_lbMinTitle!, attribute: .top, relatedBy: .equal, toItem: m_txfGoal, attribute: .bottom, multiplier: 1, constant: 20)
        let height = NSLayoutConstraint(item: m_lbMinTitle!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([leading, top, trailing, height])
    }
    
    private func minTextFieldSet() {
        m_txfMin = UITextField()
        m_txfMin!.borderStyle = .roundedRect
        m_txfMin!.keyboardType = .numberPad
        m_txfMin!.returnKeyType = .done
        self.view.addSubview(m_txfMin!)
        m_txfMin?.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func minTextFieldConstraint() {
        let top = NSLayoutConstraint(item: m_txfMin!, attribute: .top, relatedBy: .equal, toItem: m_lbMinTitle, attribute: .top, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: m_txfMin!, attribute: .height, relatedBy: .equal, toItem: m_lbMinTitle, attribute: .height, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: m_txfMin!, attribute: .width, relatedBy: .equal, toItem: m_txfMax, attribute: .width, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([top, height, width])
        
    }
    
    private func maxTitleSet() {
        m_lbMaxTitle = UILabel()
        m_lbMaxTitle!.text = "Text:Max".localized()
        m_lbMaxTitle!.textColor = UIColor.rgb(kCQueenBlue)
        self.view.addSubview(m_lbMaxTitle!)
        m_lbMaxTitle?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func maxTitleConstraint() {
        let leading = NSLayoutConstraint(item: m_lbMaxTitle!, attribute: .leading, relatedBy: .equal, toItem: m_txfMin, attribute: .trailing, multiplier: 1, constant: 10)
        let top = NSLayoutConstraint(item: m_lbMaxTitle!, attribute: .top, relatedBy: .equal, toItem: m_txfGoal!, attribute: .bottom, multiplier: 1, constant: 20)
        let trailing = NSLayoutConstraint(item: m_lbMaxTitle!, attribute: .trailing, relatedBy: .equal, toItem: m_txfMax, attribute: .leading, multiplier: 1, constant: -10)
        let height = NSLayoutConstraint(item: m_lbMaxTitle!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([leading, top, trailing, height])
        
    }
    
    private func maxTextFieldSet() {
        m_txfMax = UITextField()
        m_txfMax!.borderStyle = .roundedRect
        m_txfMax!.keyboardType = .numberPad
        m_txfMax!.returnKeyType = .done
        self.view.addSubview(m_txfMax!)
        m_txfMax?.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func maxTextFieldConstraint() {
        let trailing = NSLayoutConstraint(item: m_txfMax!, attribute: .trailing, relatedBy: .equal, toItem: m_txfGoal, attribute: .trailing, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: m_txfMax!, attribute: .height, relatedBy: .equal, toItem: m_lbMaxTitle, attribute: .height, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: m_txfMax!, attribute: .top, relatedBy: .equal, toItem: m_lbMaxTitle, attribute: .top, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([trailing, height, top])
    }
    
    private func submitBtnSet() {
        m_btnSubmit = UIButton.init(frame: CGRect(x: 30, y: 400, width: self.view.frame.width - 80, height: 40))
        m_btnSubmit!.setTitle("Text:SetDone".localized(), for: .normal)
        m_btnSubmit!.backgroundColor = UIColor.rgb(0x849324)
        m_btnSubmit!.layer.cornerRadius = kCornerRadius
        self.view.addSubview(m_btnSubmit!)
    
    }
    
    
    
    
    // Function
    @objc private func clickSubmit() {
        if inputValid() == false {
            return
        }
        self.setDelegate.setRange(self, min: Int((m_txfMin?.text)!), max: Int((m_txfMax?.text)!))
        self.setDelegate.setSize(self, size: Int((m_txfSize?.text)!))
        self.setDelegate.setGoal(self, goal: Int((m_txfGoal?.text)!))
        self.navigationController?.popViewController(animated: true)
    }
    
    private func inputValid() -> Bool {
        //Size Check
        guard let size = m_txfSize?.text else {
            return false
        }
        if size == "" {
            UIAlertController().showAlert(message: "Alert:NoSize".localized())
            return false
        }
        //Goal Check
        guard let goal = m_txfGoal?.text else {
            return false
        }
        if goal == "" {
            UIAlertController().showAlert(message: "Alert:NoGoal".localized())
            return false
        } else if Int(goal)! > Int(size)! * 2 + 2 {
            UIAlertController().showAlert(message: "Alert:WrongGoal".localized(Int(size)! * 2 + 2))
            return false
        }
        //Min & Max Check
        guard let min = m_txfMin?.text else {
            return false
        }
        if min == "" {
            UIAlertController().showAlert(message: "Alert.NoMin".localized())
            return false
        }
        guard let max = m_txfMax?.text else {
            return false
        }
        if max == "" {
            UIAlertController().showAlert(message: "Alert.NoMax".localized())
            return false
        }else if Int(max)! < Int(min)! {
            UIAlertController().showAlert(message: "Alert.WrongMax".localized())
            return false
        }else if Int(max)! - Int(min)! + 1 < Int(size)! * Int(size)! {
            UIAlertController().showAlert(message: "Alert:WrongRange".localized())
            return false
        }
        
        return true
    }
    
}

