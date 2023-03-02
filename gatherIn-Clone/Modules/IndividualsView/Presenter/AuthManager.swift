//
//  AuthManager.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/3/23.
//

import Foundation
import FirebaseAuth


class AuthManager {
    static let shared = AuthManager()
    private let auth = Auth.auth()
    private var verificationId : String?
    
    public func startAuth(phoneNumber: String, completion: @escaping (Bool)-> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] (verificationId, error) in
            guard let verificationId = verificationId, error == nil else {
                completion(false)
                return }
            
            print("Error has been occured : \(error)")
            
            self?.verificationId = verificationId
            completion(true)
        }
    }
    
    public func verifyCode(smsCode: String, completion: @escaping (Bool)-> Void) {
        // Create a credintial

        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.verificationId!,
                                                                 verificationCode: smsCode)
        auth.signIn(with: credential) { (authDataResult, error) in
            if let error = error {
                print("Error Verifiying SMS Code: \(error)")
                completion(false)
            }else {
                completion(true)
            }
        }
    }
}
