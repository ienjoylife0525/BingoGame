//
//  LocalizedExtension.swift
//  BingoGame
//
//  Created by Patato on 2018/12/6.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(_ input: Int) -> String{
        let str = NSLocalizedString(self, comment: "")
        let result = String(format: str, input)
        return result
    }
}
