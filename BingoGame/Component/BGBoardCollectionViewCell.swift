//
//  BGBoardCell.swift
//  BingoGame
//
//  Created by Patato on 2018/12/4.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation
import UIKit

class BGBoardCollectionViewCell: UICollectionViewCell {
        
    var m_lbNum: UILabel!
    var m_txfNum: UITextField!
    weak var setDataDelegate: CellInputDataDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        labelInit()
        textFieldInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func labelInit() {
//        m_lbNum = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        m_lbNum = UILabel.init()
        m_lbNum.translatesAutoresizingMaskIntoConstraints = false
        m_lbNum!.textAlignment = .center
        m_lbNum!.textColor = UIColor.white
        m_lbNum!.layer.borderWidth = 1
        self.addSubview(m_lbNum!)
        NSLayoutConstraint.activate(setConstraint(m_lbNum))
        
    }
    
    func textFieldInit() {
//        m_txfNum = UITextField.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        m_txfNum = UITextField.init()
        m_txfNum.translatesAutoresizingMaskIntoConstraints = false
        m_txfNum!.textAlignment = .center
        m_txfNum!.textColor = UIColor.white
        m_txfNum!.layer.borderWidth = 1
        m_txfNum!.layer.borderColor = UIColor.white.cgColor
        m_txfNum!.keyboardType = .numberPad
        m_txfNum!.delegate = self
        self.addSubview(m_txfNum!)
        NSLayoutConstraint.activate(setConstraint(m_txfNum))

    }
    
    func setConstraint(_ view: UIView) -> [NSLayoutConstraint] {
        let leading = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0)
        let aryCons: [NSLayoutConstraint] = [leading, trailing, top, height]
        return aryCons
    }
}

extension BGBoardCollectionViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let data = textField.text else {
            return 
        }
        self.setDataDelegate.setCellNum(self, data: data)
    }
}


