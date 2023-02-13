//
//  CodeVerificationViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/4/23.
//

import UIKit

@available(iOS 13, *)

class CodeVerificationViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var backBtn                      : UIButton!
    @IBOutlet weak var firstParagraph               : UILabel!
    @IBOutlet weak var secondParagraph              : UILabel!
    @IBOutlet weak var thirdParagraph               : UILabel!
    @IBOutlet weak var textFieldContainerView       : UIView!
    @IBOutlet weak var verificationCodeTextField    : UITextField!
    @IBOutlet weak var checkBtn                     : UIButton!
    @IBOutlet weak var fourthParagraph              : UILabel!
    @IBOutlet weak var resendCodeBtn                : UIButton!
    @IBOutlet weak var timerLbl                     : UILabel!

    // MARK: - Properties
    let defaults = UserDefaults.standard
    var phoneNumber = ""
    var timer: Timer = Timer()
    var seconds = 100
    var isTimerRunning = false
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.styleUI()
        self.defaultResendButtonStyle()
        self.defaultCheckButtonStyle()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.hideKeyboardWhenTappedAround()
        self.textFieldSetup()
    }
    // MARK: - Methods
    private func styleUI() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: .common)

        self.secondParagraph.text = "We've sent to you the verification code by SMS to ( \(phoneNumber) )"
        
    }
    
    @objc private func setTimer() {
        if seconds == 0 {
            let labelTitle: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Avenir Heavy", size: 19.0) ?? UIFont.systemFont(ofSize: 19.0),
                .foregroundColor: UIColor.systemPurple,
                .underlineStyle:NSUnderlineStyle.single.rawValue
            ]
            
            let atributedString = NSMutableAttributedString(
                string: "resend the verficiation code again.",
                attributes: labelTitle)
            
            timer.invalidate()
            timerLbl.isHidden = true
            resendCodeBtn.isEnabled = true
            resendCodeBtn.setAttributedTitle(atributedString, for: .normal)
            
        }else{
            self.defaultResendButtonStyle()
            seconds -= 1
            timerLbl.text = "\(self.timeString(time: TimeInterval(seconds)))"
            timerLbl.isHidden = false
            resendCodeBtn.isEnabled = false
        }

    }
    
    private func timeString(time: TimeInterval) -> String{
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }

    private func defaultResendButtonStyle() {
        self.resendCodeBtn.isEnabled    = false
        self.resendCodeBtn.isHidden     = false
        
        let labelTitle: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Avenir Heavy", size: 19.0) ?? UIFont.systemFont(ofSize: 19.0),
            .foregroundColor: UIColor(named: "purpleButton") ?? UIColor.black
        ]
        
        let atributedString = NSMutableAttributedString(
            string: "resend the verficiation code again.",
            attributes: labelTitle)
        resendCodeBtn.setAttributedTitle(atributedString, for: .normal)
    }
    
    private func defaultCheckButtonStyle() {
        
        self.checkBtn.clipsToBounds = true
        self.checkBtn.layer.masksToBounds = false
        self.checkBtn.layer.cornerRadius = 22
        
        self.checkBtn.isEnabled = false
        self.checkBtn.backgroundColor = #colorLiteral(red: 0.2609414458, green: 0.2709193528, blue: 0.4761442542, alpha: 0.5040400257)
    }
    
    // MARK: - Actions
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        print("Back to the previous UIViewController")
    }
    
    @IBAction func checkButton(_ sender: UIButton) {
        
        if let text = verificationCodeTextField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] (success) in
                if success {
                    DispatchQueue.main.async {
                        let vc = UIStoryboard(name: "BasicInformation", bundle: nil).instantiateViewController(withIdentifier: "BasicInformationViewController") as! BasicInformationViewController
                        self?.navigationController?.pushViewController(vc, animated: true)
                        print("Present the new VC + Save the login to the userDefaults")
                    }
                }else{
                    print("Error")
                }
            }
        }
    }
    
    @IBAction func resendCodeButton(_ sender: UIButton) {
        
        AuthManager.shared.startAuth(phoneNumber: phoneNumber) {  (success) in
            if success {
                self.seconds = 120
                self.timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.setTimer), userInfo: nil, repeats: true)
                self.timerLbl.isHidden  = false
                self.resendCodeBtn.isEnabled = false
            }else {
                print("Show alert")
            }
        }
        print("Resened the code, Timer started")
    }
    

}
/*
 if let text = verificationCodeTextField.text, !text.isEmpty {
     let code = text
     AuthManager.shared.verifyCode(smsCode: code) { [weak self] (success) in
         guard success else {return}
         DispatchQueue.main.async {
             let vc = UIStoryboard(name: "BasicInformation", bundle: nil).instantiateViewController(withIdentifier: "BasicInformationViewController") as! BasicInformationViewController
             self?.navigationController?.pushViewController(vc, animated: true)
             print("Present the new VC + Save the login to the userDefaults")
         }
     }
 }else{
     let alert = UIAlertController(title: "Incorrect Code", message: "Please make sure that the code is correct!", preferredStyle: .alert)
     self.present(alert, animated: true)
 }
 */
