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
        self.navigationItem.title = "Game Set"
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
    }
    
    private func sizeTitleSet() {
        let m_lbSizeTitle = UILabel.init(frame: CGRect(x: 30, y: 95, width: 300, height: 40))
        m_lbSizeTitle.text = "Border Size"
        m_lbSizeTitle.textColor = UIColor.black
        self.view.addSubview(m_lbSizeTitle)
    }
    
    private func sizeTextFieldSet() {
        m_txfSize = UITextField.init(frame: CGRect(x: 30, y: 140, width: self.view.frame.width - 80, height: 40))
        m_txfSize!.placeholder = "Please enter size"
        m_txfSize!.borderStyle = .roundedRect
        m_txfSize!.keyboardType = .numberPad
        m_txfSize!.returnKeyType = .done
        self.view.addSubview(m_txfSize!)
    }
    
    private func goalTitleSet() {
        let m_lbGoalTitle = UILabel.init(frame: CGRect(x: 30, y: 200, width: self.view.frame.width - 80, height: 40))
        m_lbGoalTitle.text = "Win Goal"
        m_lbGoalTitle.textColor = UIColor.black
        self.view.addSubview(m_lbGoalTitle)
    }
    
    private func goalTextFieldSet() {
        m_txfGoal = UITextField.init(frame: CGRect(x: 30, y: 245, width: self.view.frame.width - 80 , height: 40))
        m_txfGoal!.placeholder = "Please enter goal"
        m_txfGoal!.borderStyle = .roundedRect
        m_txfGoal!.keyboardType = .numberPad
        m_txfGoal!.returnKeyType = .done
        self.view.addSubview(m_txfGoal!)
        
    }
    
    private func minTitleSet() {
        let m_lbMinTitle = UILabel.init(frame: CGRect(x: 30, y: 300, width: 50, height: 40))
        m_lbMinTitle.text = "Min"
        m_lbMinTitle.textColor = UIColor.black
        self.view.addSubview(m_lbMinTitle)
    }
    
    private func minTextFieldSet() {
        m_txfMin = UITextField.init(frame: CGRect(x: 80, y: 300, width: 80, height: 40))
        m_txfMin!.borderStyle = .roundedRect
        m_txfMin!.keyboardType = .numberPad
        m_txfMin!.returnKeyType = .done
        self.view.addSubview(m_txfMin!)
        
    }
    
    private func maxTitleSet() {
        let m_lbMaxTitle = UILabel.init(frame: CGRect(x: 190, y: 300, width: 50, height: 40))
        m_lbMaxTitle.text = "Max"
        m_lbMaxTitle.textColor = UIColor.black
        self.view.addSubview(m_lbMaxTitle)
    }
    
    private func maxTextFieldSet() {
        m_txfMax = UITextField.init(frame: CGRect(x: 240, y: 300, width: 80, height: 40))
        m_txfMax!.borderStyle = .roundedRect
        m_txfMax!.keyboardType = .numberPad
        m_txfMax!.returnKeyType = .done
        self.view.addSubview(m_txfMax!)
        
    }
    
    private func submitBtnSet() {
        m_btnSubmit = UIButton.init(frame: CGRect(x: 30, y: 400, width: self.view.frame.width - 80, height: 40))
        m_btnSubmit!.setTitle("Game Start", for: .normal)
        m_btnSubmit!.setTitleColor(UIColor.blue, for: .normal)
        m_btnSubmit!.layer.borderWidth = 1
        m_btnSubmit!.layer.cornerRadius = 10
        self.view.addSubview(m_btnSubmit!)
    
    }
    
    
    // Function
    private func validAlert(msg: String){
        let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "確定", style: .default, handler: nil)
        alertController.addAction(confirm)
        self.present(alertController, animated: true, completion: nil)
    }
    
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
            validAlert(msg: "Error")
            return false
        }
        if size == "" {
            validAlert(msg: "Please input size")
            return false
        }
        //Goal Check
        guard let goal = m_txfGoal?.text else {
            validAlert(msg: "Error")
            return false
        }
        if goal == "" {
            validAlert(msg: "Please input goal")
            return false
        } else if Int(goal)! > Int(size)! * 2 + 2 {
            validAlert(msg: "Goal maximum is \(Int(size)! * 2 + 2)")
            return false
        }
        //Min & Max Check
        guard let min = m_txfMin?.text else {
            validAlert(msg: "Error")
            return false
        }
        if min == "" {
            validAlert(msg: "Please input minimum")
            return false
        }
        guard let max = m_txfMax?.text else {
            validAlert(msg: "Error")
            return false
        }
        if max == "" {
            validAlert(msg: "Please input maximum")
            return false
        }else if Int(max)! < Int(min)! {
            validAlert(msg: "Maximun should biger than minimum")
            return false
        }else if Int(max)! - Int(min)! + 1 < Int(size)! * Int(size)! {
            validAlert(msg: "Random range should biger than chess ")
            return false
        }
        
        
        return true
    }
    
}

