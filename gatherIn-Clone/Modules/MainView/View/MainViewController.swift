//
//  MainViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/23/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var individualsBtn   :UIButton!
    @IBOutlet weak var businessBtn      :UIButton!
    // MARK:- Properties
    var presenter: MainPresenter?
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(view: self)
        self.styleUI()
        
    }
    
    // MARK:- Methods
    private func styleUI() {
        self.navigationController?.navigationBar.isHidden = true
        
        self.individualsBtn.layer.cornerRadius = 20
        self.businessBtn.layer.cornerRadius = 20
        self.individualsBtn.layer.masksToBounds = false
        self.businessBtn.layer.masksToBounds = false
    }
    
    // MARK:- Actions
    @IBAction func forIndividutualBtn(_ sender: UIButton) {
        let individualsVC = UIStoryboard(name: "Individuals", bundle: nil).instantiateViewController(identifier: "individualsView") as! IndividualsViewController
        self.navigationController?.pushViewController(individualsVC, animated: true)
    }
    
    @IBAction func forBusinessBtn(_ sender: UIButton) {
        print("Business' view")
        
    }
}

// MARK:- Presenter
extension MainViewController: MainPresenterPr {
    
}
