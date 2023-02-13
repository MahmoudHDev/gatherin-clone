//
//  CodeVerifcation+TextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/6/23.
//

import UIKit

@available(iOS 13, *)
extension CodeVerificationViewController: UITextFieldDelegate {
    
    
    func textFieldSetup() {
        self.verificationCodeTextField.delegate = self
        self.verificationCodeTextField.becomeFirstResponder()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 6
        let currentString = (verificationCodeTextField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        if newString.count >= maxLength {
            checkBtn.isEnabled = true
            checkBtn.backgroundColor = #colorLiteral(red: 0.4309644103, green: 0.3406741023, blue: 0.6719501019, alpha: 1)
        }else{
            checkBtn.isEnabled = false
            checkBtn.backgroundColor = #colorLiteral(red: 0.2609414458, green: 0.2709193528, blue: 0.4761442542, alpha: 0.5040400257)
        }
        
        return newString.count <= maxLength

    }
    
    
}
