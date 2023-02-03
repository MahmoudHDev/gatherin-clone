//
//  IndividualsView+TextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/28/23.
//

import UIKit

extension IndividualsViewController: UITextFieldDelegate {
    
    func phoneNumberTextStyle() {
        self.phoneNumberTextField.defaultRegion = "SA"
        
        self.phoneNumberTextField.delegate = self
        self.phoneNumberTextField.flagButton = CountryCodeBtn
        self.phoneNumberTextField.withFlag = false
        self.phoneNumberTextField.withPrefix = false
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text)
        let maxLength = 12
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        if newString.count >= maxLength {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = #colorLiteral(red: 0.4309644103, green: 0.3406741023, blue: 0.6719501019, alpha: 1)
        }else{
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = #colorLiteral(red: 0.2609414458, green: 0.2709193528, blue: 0.4761442542, alpha: 0.5040400257)

        }
        
        
        return newString.count <= maxLength
    }

}
