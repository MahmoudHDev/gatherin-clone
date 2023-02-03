//
//  IndividualsView+TextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/28/23.
//

import UIKit

extension IndividualsViewController: UITextFieldDelegate {
    
    func phoneNumberTextStyle() {
        self.phoneNumberTextField.maxDigits = 15
        self.phoneNumberTextField.delegate = self
        self.phoneNumberTextField.flagButton = CountryCodeBtn
        self.phoneNumberTextField.withFlag = true
        self.phoneNumberTextField.defaultRegion = "SA"
        
        phoneNumberTextField.withExamplePlaceholder = true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
