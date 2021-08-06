//
//  ViewController.swift
//  Sign
//
//  Created by 임승혁 on 2021/08/05.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var idTextfield: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    @IBOutlet var createAccountButton: UIButton!
    
    private var inputPassword: String = ""
    private var idValidation: Bool = false
    private var passwordValidation: Bool = false
    private var confirmPasswordValidation: Bool = false
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - SetUp Views
    private func setUpViews() {
        setUpCreatAccountButton()
        
        setUpCommonStateTextField(idTextfield)
        setUpCommonStateTextField(passwordTextField)
        setUpCommonStateTextField(passwordConfirmTextField)
    }
    
    private func setUpCreatAccountButton() {
        createAccountButton.layer.cornerRadius = 8
    }
    
    private func setUpCommonStateTextField(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
    }

    @IBAction func changedID(_ sender: UITextField) {
        guard let inputText = sender.text, !inputText.isEmpty else {
            setUpCommonStateTextField(sender)
            return
        }
        
        validateIdForm(input: inputText, textField: sender)
        
        validateSignUpForm()
    }
    
    @IBAction func changedPassword(_ sender: UITextField) {
        guard let inputText = sender.text, !inputText.isEmpty else {
            setUpCommonStateTextField(sender)
            return
        }
        
        inputPassword = inputText
        validatePasswordForm(input: inputPassword, textField: sender)
        
        validateSignUpForm()
    }
    
    @IBAction func changedConfirmPassword(_ sender: UITextField) {
        guard let inputText = sender.text, !inputText.isEmpty else {
            setUpCommonStateTextField(sender)
            return
        }
        
        validatePasswordForm(input: inputPassword, textField: sender)
    
        validateSignUpForm()
    }
    
    // MARK: - Validate Value
    private func validateIdForm(input: String, textField: UITextField) {
        idValidation = validateIdLength(input: input)
        updateTextFieldBorderState(state: idValidation, textField)
    }
    
    private func validatePasswordForm(input: String, textField: UITextField) {
        passwordValidation = validatePasswordLength(input: input)
        updateTextFieldBorderState(state: passwordValidation, textField)
    }
    
    private func validateConfirmPasswordForm(input: String, textField: UITextField) {
        confirmPasswordValidation = validateConfirmPassword(input: input)
        updateTextFieldBorderState(state: confirmPasswordValidation, textField)
    }
    
    private func validateIdLength(input: String) -> Bool {
        let minIdLength = 2
        let maxIdLength = 10
        
        return input.count >= minIdLength && input.count <= maxIdLength
    }
    
    private func validatePasswordLength(input: String) -> Bool {
        let minPasswordLength = 5
        
        return input.count >= minPasswordLength
    }
    
    private func validateConfirmPassword(input: String) -> Bool {
        return input == inputPassword && validatePasswordLength(input: input)
    }
    
    private func validateSignUpForm() {
        let accountFormValidation = idValidation && passwordValidation && confirmPasswordValidation
        updateCreatAccountButtonState(accountValidation: accountFormValidation)
    }
    
    // MARK: - Update Views
    private func updateTextFieldBorderState(state: Bool, _ textField: UITextField) {
        state ? textField.correctForm() : textField.incorrectForm()
    }
    
    private func updateCreatAccountButtonState(accountValidation: Bool) {
        if accountValidation {
            createAccountButton.backgroundColor = .systemTeal
            createAccountButton.isEnabled = true
        } else {
            createAccountButton.backgroundColor = .lightGray
            createAccountButton.isEnabled = false
        }
    }
}
