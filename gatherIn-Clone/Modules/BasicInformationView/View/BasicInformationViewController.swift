//
//  BasicInformationViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/11/23.
//

import UIKit
@available(iOS 13, *)

class BasicInformationViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var firsParagraph        : UILabel!
    @IBOutlet weak var nameLbl              : UILabel!
    @IBOutlet weak var nameTextField        : UITextField!
    @IBOutlet weak var nameContainerView    : UIView!
    @IBOutlet weak var nameErrorLbl         : UILabel!
    @IBOutlet weak var emailLbl             : UILabel!
    @IBOutlet weak var emailContainerView   : UIView!
    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var emailErrorLbl        : UILabel!
    @IBOutlet weak var registerButton       : UIButton!
    @IBOutlet weak var lastParagraph        : UILabel!
    
    // MARK:- Properties
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UIStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.textHyperLink()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.textFieldConfig()
        self.hideKeyboardWhenTappedAround()

    }
    
    // MARK:- Methods
    private func UIStyle() {
        self.nameContainerView.clipsToBounds = true
        self.nameContainerView.layer.masksToBounds = false
        
        self.emailContainerView.clipsToBounds = true
        self.emailContainerView.layer.masksToBounds = false
        
        self.registerButton.clipsToBounds = true
        self.registerButton.layer.masksToBounds = false
    }
    
    private func textHyperLink() {
        let atributedString = NSMutableAttributedString(string: "When you create an account on gathern. You accept our Privacy & Policy and the Terms & Conditions.")
        let firstRange = (atributedString.string as NSString).range(of: "Privacy & Policy")
        let secondRange = (atributedString.string as NSString).range(of: "Terms & Conditions")
        
        atributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: firstRange)
        atributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: secondRange)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(privacyAndPolicy))
        lastParagraph.attributedText = atributedString
        lastParagraph.addGestureRecognizer(tapRecognizer)
    }
    
    @objc
    private func privacyAndPolicy() {
        print("Privacy and policy has been tapped")
    }
    
    // MARK:- Actions
    
    @IBAction func registerBtn(_ sender: UIButton) {
        // If textfields {}
        print("Register and view the new viewController")
    }
    
}
