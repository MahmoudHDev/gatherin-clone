//
//  IndividualsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/26/23.
//

import UIKit
import PhoneNumberKit
import IQKeyboardManagerSwift

class IndividualsViewController: UIViewController, CountryDelegate {

    //MARK:- Outlets
    @IBOutlet weak var welcomeLbl               : UILabel!
    @IBOutlet weak var PhoneNumberIntroLbl      : UILabel!
    @IBOutlet weak var phoneNumberLbl           : UILabel!
    
    @IBOutlet weak var countryCodeContainerView : UIView!
    @IBOutlet weak var CountryCodeBtn           : UIButton!
    @IBOutlet weak var chevonorArrowImg         : UIImageView!
    
    @IBOutlet weak var phoneNumberContainerView : UIView!
    @IBOutlet weak var phoneNumberTextField     : PhoneNumberTextField!
    
    @IBOutlet weak var errorMessageLbl          : UILabel!
    @IBOutlet weak var loginBtn                 : UIButton!
    @IBOutlet weak var confirmationMessageLbl   : UILabel!
    @IBOutlet weak var noteMessageLbl           : UILabel!
    
    
    // MARK:- Properties
    let phoneNumber = PhoneNumberKit()
    var selectedCountryCode = "+966"
    var userNumber = ""
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styleUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.phoneNumberTextStyle()
    }
    
    // MARK:- Methods
    private func styleUI() {
        self.hideKeyboardWhenTappedAround()
        
        self.loginBtn.layer.masksToBounds = false
        self.loginBtn.clipsToBounds = true
        self.loginBtn.layer.cornerRadius = 20

        self.countryCodeContainerView.layer.cornerRadius = 22
        self.countryCodeContainerView.layer.masksToBounds = false
        self.countryCodeContainerView.clipsToBounds = true
        
        self.phoneNumberContainerView.layer.cornerRadius = 22
        
        
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(tappedArrow))
        countryCodeContainerView.isUserInteractionEnabled = true
        countryCodeContainerView.addGestureRecognizer(imageGesture)
        CountryCodeBtn.setTitle("\(self.flag(country: "SA")) +966", for: .normal)
        
        loginBtn.isEnabled = false
        loginBtn.backgroundColor = #colorLiteral(red: 0.2609414458, green: 0.2709193528, blue: 0.4761442542, alpha: 0.5040400257)
        
    }
    
    
    func selectedCoutry(country: String) {
        
        let countryCode   = phoneNumber.countryCode(for: country)
        let numberExample = phoneNumber.getExampleNumber(forCountry: country)
        self.selectedCountryCode = "+\(countryCode ?? 966)"
        self.phoneNumberTextField.defaultRegion = country

        phoneNumberTextField.placeholder = String(numberExample?.numberString ?? "05123456789")
        CountryCodeBtn.setTitle("\(self.flag(country: country)) +\(countryCode ?? 966)", for: .normal)
        
    }
    
    private func flag(country code: String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in code.utf16 {
            usv.append(UnicodeScalar(base + Int(i))!)
        }
        return String(usv)
    }
    
    @objc
    func tappedArrow() {
        let countries = CountryTableViewController()
        countries.delegate = self
        self.present(UINavigationController(rootViewController: countries), animated: true, completion: nil)

    }

    // MARK:- Actions
    @IBAction func loginBtn(_ sender: UIButton) {
        userNumber = ("\(selectedCountryCode)\(phoneNumberTextField.text ?? "Error")")

        if phoneNumberTextField.text?.isEmpty == false {
            print("User number is: \(userNumber)")
        }else {
            print("TextField is empty")
        }
    }
    
    @IBAction func countryCodeBtn(_ sender: UIButton) {
        
        let countries = CountryTableViewController()
        countries.delegate = self
        self.present(UINavigationController(rootViewController: countries), animated: true, completion: nil)
    }
    
}
