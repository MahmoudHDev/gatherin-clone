//
//  MainViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/23/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK:- Outlets
    
    // MARK:- Properties
    var presenter: MainPresenter?
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(view: self)
        // Do any additional setup after loading the view.
    }
    
    // MARK:- Methods
    
}

// MARK:- Presenter
extension MainViewController: MainPresenterPr {
    
}
