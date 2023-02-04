//
//  CodeVerificationViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/4/23.
//

import UIKit

class CodeVerificationViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var firstParagraph               : UILabel!
    @IBOutlet weak var secondParagraph              : UILabel!
    @IBOutlet weak var thirdParagraph               : UILabel!
    @IBOutlet weak var verificationCodeTextField    : UITextField!
    @IBOutlet weak var checkBtn                     : UIButton!
    @IBOutlet weak var fourthParagraph              : UILabel!
    @IBOutlet weak var resendCodeBtn                : UIButton!
    @IBOutlet weak var timerLbl                     : UILabel!

    // MARK: - Properties
    var phoneNumber = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(phoneNumber)
    }
    
    // MARK: - Methods
    
    
    // MARK: - Actions
    @IBAction func checkButton(_ sender: UIButton) {
        print("Check the code ...")
    }
    
    @IBAction func resendCodeButton(_ sender: UIButton) {
        print("Resened the code ...")
    }
    

}
