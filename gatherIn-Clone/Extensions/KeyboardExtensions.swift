//
//  KeyboardExtensions.swift
//  SH-Elevator-Mainenance
//
//  Created by Mahmoud Hashim on 2/3/23.
//

import UIKit.UIView


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }
}
