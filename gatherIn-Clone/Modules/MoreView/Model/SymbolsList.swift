//
//  SymbolsList.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/17/23.
//

import UIKit.UIImage

@available(iOS 13, *)
// Thread 1: "-[UIImage imageWithTintColor:]: unrecognized selector sent to instance 0x28275e450"

enum SymbolsList: CaseIterable {
    
    static let profile          = UIImage(named: "person")
    static let walletLog        = UIImage(named: "wallet.pass")
    static let rateUs           = UIImage(named: "thumbs-up")
    static let hostWithUs       = UIImage(named: "house")
    static let paymentOptions   = UIImage(named: "payment-option")
    static let contactUs        = UIImage(named: "envelope")
    static let inviteAFriend    = UIImage(named: "invitation")
    static let repeatedInquiry  = UIImage(named: "RepeatedQuestions")
    static let termsOfUse       = UIImage(named: "terms-and-conditions")
    static let privacyPolicy    = UIImage(named: "privacy&Policy")
    static let language         = UIImage(named: "language")
    static let logout           = UIImage(named: "logout")

}
