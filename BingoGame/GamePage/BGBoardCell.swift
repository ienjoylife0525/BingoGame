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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        m_lbNum = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        m_lbNum.textAlignment = .center
        m_lbNum.textColor = UIColor.white
        m_lbNum.layer.borderWidth = 1
        m_lbNum.layer.borderColor = UIColor.white.cgColor
        self.addSubview(m_lbNum)
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
