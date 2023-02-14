//
//  IndividualsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/26/23.
//

import UIKit
import FirebaseAuth
import PhoneNumberKit
import IQKeyboardManagerSwift

class IndividualsViewController: UIViewController, CountryDelegate, InterfaceStyleProtocol {
    
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
    var isLogin: Bool = false
    
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiStyle()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.phoneNumberTextStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.checkNetwork()
    }
    
    // MARK:- Methods
    func uiStyle() {
        self.hideKeyboardWhenTappedAround()
        
        self.loginBtn.layer.masksToBounds = false
        self.loginBtn.clipsToBounds = true
        self.loginBtn.layer.cornerRadius = 20
        
        self.countryCodeContainerView.layer.cornerRadius = 22
        self.countryCodeContainerView.layer.masksToBounds = false
        self.countryCodeContainerView.clipsToBounds = true
        
        
        self.phoneNumberContainerView.layer.cornerRadius = 22
        self.phoneNumberContainerView.layer.masksToBounds = false
        self.phoneNumberContainerView.clipsToBounds  = true
        
        
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
    
    
    private func checkNetwork() {
        if Reachability.isConnectedToNetwork() {
            print("Device is connected to the network")
        }else {
            let alert = UIAlertController(title: "Network Error", message: "Your Device is not connected to the network", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Cellular", style: .default, handler: { (cellular) in
                UIApplication.shared.openURL(URL(string: "App-prefs:root=MOBILEDATA")!)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    // MARK:- Actions
    @available(iOS 13.0, *)
    @IBAction func loginBtn(_ sender: UIButton) {
        userNumber = ("\(selectedCountryCode)\(phoneNumberTextField.text ?? "Error")")
        
        if Reachability.isConnectedToNetwork() {
            if userNumber.isEmpty {
                print("TextField is empty")
            }else{
                loginBtn.isEnabled = false
                loginBtn.backgroundColor = #colorLiteral(red: 0.2609414458, green: 0.2709193528, blue: 0.4761442542, alpha: 0.5040400257)

                AuthManager.shared.startAuth(phoneNumber: userNumber) { [weak self] (success) in
                    guard success else {return}
                    self?.CountryCodeBtn.isEnabled = false

                    print("Success")
                    DispatchQueue.main.async {
                        
                        let vc = UIStoryboard(name: "CodeVerification", bundle: nil).instantiateViewController(withIdentifier: "CodeVerificationViewController") as! CodeVerificationViewController
                        vc.phoneNumber = self?.userNumber ?? "No Number"
                        self?.navigationController?.pushViewController(vc, animated: true)
                        print("Show the CodeVerificationViewController")
                    }
                }
            }
            
        }else{
            let alert = UIAlertController(title: "Network Error", message: "Your Device is not connected to the network", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Cellular", style: .default, handler: { (cellular) in
                UIApplication.shared.openURL(URL(string: "App-prefs:root=MOBILEDATA")!)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func countryCodeBtn(_ sender: UIButton) {
        
        let countries = CountryTableViewController()
        countries.delegate = self
        self.present(UINavigationController(rootViewController: countries), animated: true, completion: nil)
    }
    
}
