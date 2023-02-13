//
//  BasicInformation+TextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/11/23.
//


import UIKit
@available(iOS 13, *)

extension BasicInformationViewController: UITextFieldDelegate {
    
    func textFieldConfig() {
        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
            return true
        case emailTextField:
            nameTextField.becomeFirstResponder()
            return true
        default:
            self.hideKeyboardWhenTappedAround()
        }
        return true
    }
    
}
