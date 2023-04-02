//
//  MainViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/23/23.
//

import UIKit

@available(iOS 13.0, *)

class MainViewController: UIViewController, InterfaceStyleProtocol, LocalizationProtocol {
    // MARK:- Outlets
    @IBOutlet weak var useGatherInLbl   : UILabel!
    @IBOutlet weak var individualsBtn   : UIButton!
    @IBOutlet weak var businessBtn      : UIButton!
    @IBOutlet weak var changeLanguageBtn: UIButton!
    // MARK:- Properties
    var presenter: MainPresenter?
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainPresenter(view: self)
        self.uiStyle()
        self.localizationForButtons()
        self.localizationForLabels()

    }
    
    // MARK:- Methods
        func uiStyle() {
        self.navigationController?.navigationBar.isHidden   = true
        
        self.individualsBtn.layer.cornerRadius              = 20
        self.businessBtn.layer.cornerRadius                 = 20
                        
        self.individualsBtn.layer.masksToBounds             = false
        self.businessBtn.layer.masksToBounds                = false
    }
    
    func localizationForButtons() {
        self.individualsBtn.setTitle(NSLocalizedString      ("ForIndividuals", comment: ""),    for: .normal)
        self.businessBtn.setTitle(NSLocalizedString         ("ForBusiness", comment: ""),       for: .normal)
        self.changeLanguageBtn.setTitle(NSLocalizedString   ("ChangeLanguage", comment: ""),    for: .normal)
    }
    
    func localizationForLabels() {
        useGatherInLbl.text = NSLocalizedString("IWantToUseGatherIn", comment: "First Paragraph")
    }
    
    // MARK:- Actions
    @IBAction func forIndividutualBtn(_ sender: UIButton) {
        let individualsVC = UIStoryboard(name: "Individuals", bundle: nil).instantiateViewController(withIdentifier: "individualsView") as! IndividualsViewController
        self.navigationController?.pushViewController(individualsVC, animated: true)
    }
    
    @IBAction func forBusinessBtn(_ sender: UIButton) {
        print("Business' view")
        
    }
    @IBAction func chanageLanguageButton(_ sender: UIButton) {
        
        let currentLanguage  = Locale.current.languageCode
        
        let newLanguage      = currentLanguage == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
        exit(0)
    }
    
}

// MARK:- Presenter
@available(iOS 13.0, *)
extension MainViewController: MainPresenterPr {
    
}
