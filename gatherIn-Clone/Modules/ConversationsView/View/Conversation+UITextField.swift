//
//  Conversation+UITextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/21/23.
//

import UIKit

extension ConversationsViewController: UITextFieldDelegate {
    
    func setupTextField() {
        self.searchTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // To search for a specific chat
        return true
    }
    
}
