//
//  BGBoardCell.swift
//  BingoGame
//
//  Created by Patato on 2018/12/4.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation
import UIKit

class BGBoardCell: UICollectionViewCell {
        
    var m_lbNum: UILabel!
    var m_txfNum: UITextField!
    weak var setDataDelegate: CellInputDataDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
    }
    
    func labelStyle() {
        m_lbNum = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        m_lbNum.textAlignment = .center
        m_lbNum.textColor = UIColor.white
        m_lbNum.layer.borderWidth = 1
        m_lbNum.backgroundColor = UIColor.init(red: 255 / 255, green: 251 / 255, blue: 189 / 255, alpha: 1)
        self.addSubview(m_lbNum)
        self.m_txfNum.removeFromSuperview()
        
    }
    
    func texfieldStyle() {
        m_txfNum = UITextField.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        m_txfNum.textAlignment = .center
        m_txfNum.textColor = UIColor.white
        m_txfNum.layer.borderWidth = 1
        m_txfNum.layer.borderColor = UIColor.white.cgColor
        m_txfNum.keyboardType = .numberPad
        self.addSubview(m_txfNum)
        m_txfNum.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BGBoardCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let data = textField.text else {
            return 
        }
        self.setDataDelegate.setCellNum(self, data: data)
    }
}


