//
//  IndividualsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/26/23.
//

import UIKit

class IndividualsViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var welcomeLbl               : UILabel!
    @IBOutlet weak var PhoneNumberIntroLbl      : UILabel!
    @IBOutlet weak var phoneNumberLbl           : UILabel!
    
    @IBOutlet weak var countryCodeContainerView : UIView!
    @IBOutlet weak var countrycodeImg           : UIImageView!
    @IBOutlet weak var CountryCodeBtn           : UIButton!
    @IBOutlet weak var chevonorArrowImg         : UIImageView!
    
    @IBOutlet weak var phoneNumberContainerView : UIView!
    @IBOutlet weak var phoneNumberTextField     : UITextField!
    
    @IBOutlet weak var errorMessageLbl          : UILabel!
    @IBOutlet weak var loginBtn                 : UIButton!
    @IBOutlet weak var confirmationMessageLbl   : UILabel!
    @IBOutlet weak var noteMessageLbl           : UILabel!
    
    
    // MARK:- Properties
    
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK:- Methods
    private func styleUI() {
        
    }
    
    
    // MARK:- Actions
    @IBAction func loginBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func countryCodeBtn(_ sender: UIButton) {
        
    }
    
}
