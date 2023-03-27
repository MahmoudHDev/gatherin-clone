//
//  ReservationsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit

class ReservationsViewController: UIViewController {
    // MARK:- Properties

    
    // MARK:- Outlets
    @IBOutlet weak var reservationsTableView: UITableView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationControllerStyle()
        self.reservationsTableView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupReservationTableView()
    }
    // MARK:- Methods
    private func navigationControllerStyle() {
        title = NSLocalizedString("MyReservations", comment: "")
        
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "purpleButton")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK:- Actions

}
