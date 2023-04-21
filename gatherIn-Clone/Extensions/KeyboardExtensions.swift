//
//  KeyboardExtensions.swift
//  SH-Elevator-Mainenance
//
//  Created by Mahmoud Hashim on 2/3/23.
//

import UIKit


extension UIViewController {
// Dismiss keyboard in all UIViewControllers
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }
}
