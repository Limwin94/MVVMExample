//
//  ViewController.swift
//  Sign
//
//  Created by 임승혁 on 2021/08/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var idTextfield: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    @IBOutlet var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextfield.delegate = self
        passwordTextField.delegate = self
        passwordConfirmTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == idTextfield {
            
        } else if textField == passwordTextField {
            
        } else if textField == passwordConfirmTextField {
            
        }
    }
}
