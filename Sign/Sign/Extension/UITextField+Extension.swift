//
//  UITextField+Extension.swift
//  Sign
//
//  Created by 임승혁 on 2021/08/06.
//

import UIKit

extension UITextField {
    func correctForm() {
        self.layer.borderColor = UIColor.green.cgColor
    }
    
    func incorrectForm() {
        self.layer.borderColor = UIColor.red.cgColor
    }
}
