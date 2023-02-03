//
//  IndividualsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/26/23.
//

import UIKit
import PhoneNumberKit


class IndividualsViewController: UIViewController, CountryDelegate {

    //MARK:- Outlets
    @IBOutlet weak var welcomeLbl               : UILabel!
    @IBOutlet weak var PhoneNumberIntroLbl      : UILabel!
    @IBOutlet weak var phoneNumberLbl           : UILabel!
    
    @IBOutlet weak var countryCodeContainerView : UIView!
    @IBOutlet weak var countrycodeImg           : UIImageView!
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
        
        self.loginBtn.layer.masksToBounds = false
        self.loginBtn.clipsToBounds = true
        self.loginBtn.layer.cornerRadius = 20

        self.countryCodeContainerView.layer.cornerRadius = 22
        self.countryCodeContainerView.layer.masksToBounds = false
        self.countryCodeContainerView.clipsToBounds = true
        
        self.phoneNumberContainerView.layer.cornerRadius = 22
    }
    
    
    func selectedCoutry(country: String) {
        
        let countryCode = phoneNumber.countryCode(for: country)
        phoneNumberTextField.text = "+\(countryCode ?? 966)"
    }
    
    // MARK:- Actions
    @IBAction func loginBtn(_ sender: UIButton) {
        print("Send the confirmation code to the user")
    }
    
    @IBAction func countryCodeBtn(_ sender: UIButton) {
        print("Show a tableview with the country Code")
        
        let countries = CountryTableViewController()
        countries.delegate = self
            countries.modalPresentationStyle = .fullScreen
        self.present(UINavigationController(rootViewController: countries), animated: true, completion: nil)
    }
    
}
