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
import NVActivityIndicatorView

@available(iOS 13, *)

class IndividualsViewController: UIViewController, CountryDelegate, InterfaceStyleProtocol, LocalizationProtocol {

    
    //MARK:- Outlets
    @IBOutlet weak var scrollView               : UIScrollView!
    @IBOutlet weak var welcomeLbl               : UILabel!
    @IBOutlet weak var PhoneNumberIntroLbl      : UILabel!
    @IBOutlet weak var phoneNumberLbl           : UILabel!
    
    @IBOutlet weak var countryCodeContainerView : UIView!
    @IBOutlet weak var CountryCodeBtn           : UIButton!
    @IBOutlet weak var chevonorArrowImg         : UIImageView!
    
    @IBOutlet weak var phoneNumberTextField     : PhoneNumberTextField!
    
    @IBOutlet weak var errorMessageLbl          : UILabel!
    @IBOutlet weak var loginBtn                 : UIButton!
    @IBOutlet weak var confirmationMessageLbl   : UILabel!
    @IBOutlet weak var noteMessageLbl           : UILabel!
    @IBOutlet weak var indicatorContainerView   : UIView!
    @IBOutlet weak var indicator                : NVActivityIndicatorView!
    
    // MARK:- Properties
    let phoneNumber         = PhoneNumberKit()
    var selectedCountryCode = "+20"
    var userNumber          = ""
    var isLogin: Bool       = false

    
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiStyle()
        self.localizationForButtons()
        self.localizationForLabels()
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
        self.loginBtn.layer.cornerRadius = 20
        
        self.countryCodeContainerView.layer.cornerRadius = 22
        self.countryCodeContainerView.layer.masksToBounds = false
        
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(tappedArrow))
        countryCodeContainerView.isUserInteractionEnabled = true
        countryCodeContainerView.addGestureRecognizer(imageGesture)
        CountryCodeBtn.setTitle("\(self.flag(country: "EG")) +20", for: .normal)
        
        loginBtn.isEnabled = false
        loginBtn.backgroundColor = #colorLiteral(red: 0.2609414458, green: 0.2709193528, blue: 0.4761442542, alpha: 0.5040400257)
        
        indicatorContainerView.layer.masksToBounds = false
        
        indicatorContainerView.isHidden = true

    }
    
    func localizationForButtons() {
        self.loginBtn.setTitle(NSLocalizedString("Sendcode", comment: "Login Button"), for: .normal)
    }
    
    func localizationForLabels() {
        welcomeLbl.text          = NSLocalizedString("", comment: "Welcome")
        PhoneNumberIntroLbl.text = NSLocalizedString("PleaseEnterPhoneNo", comment: "")
        phoneNumberLbl.text  = NSLocalizedString("PhoneNumber", comment: "")
        
        confirmationMessageLbl.text = NSLocalizedString("MessageYouShortly", comment: "")
        noteMessageLbl.text = NSLocalizedString("phoneNumberIsCorrect", comment: "")
        
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
    private func tappedArrow() {
        let countries = CountryTableViewController()
        countries.delegate = self
        self.present(UINavigationController(rootViewController: countries), animated: true, completion: nil)
        
    }
    
    private func checkNetwork() {
        if Reachability.isConnectedToNetwork() {
            print("Device is connected to the network")
        }else {
            let alert = UIAlertController(title: NSLocalizedString("NetworkError", comment: "Err"), message: NSLocalizedString("NetworkErrorMessage", comment: "error details message"), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "okay button"), style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cellular", comment: "Settings Date"), style: .default, handler: { (cellular) in
                guard let url = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) else {return}
                UIApplication.shared.open(url)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK:- Actions
    @IBAction func loginBtn(_ sender: UIButton) {
        userNumber = ("\(selectedCountryCode)\(phoneNumberTextField.text ?? "Error")")
        
        if Reachability.isConnectedToNetwork() {
            if userNumber.isEmpty {
                print("TextField is empty")
            }else{
                self.scrollView.isScrollEnabled = false
                self.phoneNumberTextField.isUserInteractionEnabled = false

                self.indicator.startAnimating()
                self.indicatorContainerView.isHidden = false
                
                loginBtn.isEnabled = false
                loginBtn.backgroundColor = #colorLiteral(red: 0.2609414458, green: 0.2709193528, blue: 0.4761442542, alpha: 0.5040400257)
                AuthManager.shared.startAuth(phoneNumber: userNumber) { [weak self] (success) in
                    guard success else {return}
                    
                    self?.CountryCodeBtn.isEnabled = false
                    self?.indicator.startAnimating()
                    print("Success and the view is being proccessed")
                    DispatchQueue.main.async {
                        self?.indicatorContainerView.isHidden = true
                        self?.indicator.stopAnimating()
                        let vc = UIStoryboard(name: "CodeVerification", bundle: nil).instantiateViewController(withIdentifier: "CodeVerificationViewController") as! CodeVerificationViewController
                        vc.phoneNumber = self?.userNumber ?? "No Number"
                        self?.navigationController?.pushViewController(vc, animated: true)
                        print("Show the CodeVerificationViewController")
                    }
                }
            }
        }else{
            indicator.stopAnimating()
            indicatorContainerView.isHidden = true

            self.scrollView.isScrollEnabled = true
            self.phoneNumberTextField.isUserInteractionEnabled = true

            let alert = UIAlertController(title: NSLocalizedString("NetworkError", comment: "Err"), message: NSLocalizedString("NetworkErrorMessage", comment: "error details message"), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "okay button"), style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cellular", comment: "Settings Date"), style: .default, handler: { (cellular) in
                guard let url = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) else {return}
                UIApplication.shared.open(url)
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
