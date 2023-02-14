//
//  MainViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/23/23.
//

import UIKit

@available(iOS 13.0, *)
class MainViewController: UIViewController, InterfaceStyleProtocol {
    
    // MARK:- Outlets
    @IBOutlet weak var individualsBtn   :UIButton!
    @IBOutlet weak var businessBtn      :UIButton!
    
    // MARK:- Properties
    var presenter: MainPresenter?
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(view: self)
        self.uiStyle()
        
    }
    
    // MARK:- Methods
        func uiStyle() {
        self.navigationController?.navigationBar.isHidden = true
        
        self.individualsBtn.layer.cornerRadius = 20
        self.businessBtn.layer.cornerRadius = 20
        self.individualsBtn.layer.masksToBounds = false
        self.businessBtn.layer.masksToBounds = false
    }
    
    // MARK:- Actions
    @available(iOS 13.0, *)
    @IBAction func forIndividutualBtn(_ sender: UIButton) {
        let individualsVC = UIStoryboard(name: "Individuals", bundle: nil).instantiateViewController(withIdentifier: "individualsView") as! IndividualsViewController
        self.navigationController?.pushViewController(individualsVC, animated: true)
    }
    
    @IBAction func forBusinessBtn(_ sender: UIButton) {
        print("Business' view")
        
    }
}

// MARK:- Presenter
@available(iOS 13.0, *)
extension MainViewController: MainPresenterPr {
    
}
