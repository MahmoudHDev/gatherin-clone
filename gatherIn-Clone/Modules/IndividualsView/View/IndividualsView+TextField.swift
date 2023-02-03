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
//        phoneNumberTextField.withExamplePlaceholder = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 17
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        return newString.count <= maxLength
    }
}
