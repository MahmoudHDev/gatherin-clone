//
//  IndividualsView+TextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/28/23.
//

import UIKit

extension IndividualsViewController: UITextFieldDelegate {
    
    func phoneNumberTextStyle() {
        self.phoneNumberTextField.delegate = self
        self.phoneNumberTextField.defaultRegion = "SA"
        self.phoneNumberTextField.flagButton = CountryCodeBtn        
        let defaultNumber = self.phoneNumber.getExampleNumber(forCountry: "SA")
        self.phoneNumberTextField.placeholder = defaultNumber!.numberString
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
