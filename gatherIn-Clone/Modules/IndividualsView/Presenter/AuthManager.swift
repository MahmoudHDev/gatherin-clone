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
        print("Start AuthenticationO")
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] (verificationId, error) in
            if let err = error {
                print("Error Has Been Occured \(err.localizedDescription)")
                completion(false)
            }else {
                guard let verificationId = verificationId, error == nil else {
                    completion(false)
                    return }
                
                self?.verificationId = verificationId

                completion(true)
            }            
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
