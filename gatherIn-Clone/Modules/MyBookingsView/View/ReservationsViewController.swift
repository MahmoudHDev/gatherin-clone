//
//  ReservationsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit

class ReservationsViewController: UIViewController, LocalizationProtocol {
    
    // MARK:- Properties

    
    // MARK:- Outlets
    @IBOutlet weak var reservationsTableView: UITableView!
    @IBOutlet weak var NoDataImg    : UIImageView!
    @IBOutlet weak var noDataLbl    : UILabel!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationControllerStyle()
        self.reservationsTableView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupReservationTableView()
        self.localizationForButtons()
        self.localizationForLabels()
    }
    // MARK:- Methods
    private func navigationControllerStyle() {
        title = NSLocalizedString("MyReservations", comment: "")
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "purpleButton")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func localizationForButtons() {
        
    }
    
    func localizationForLabels() {
        noDataLbl.text = NSLocalizedString("NoReservations", comment: "")
        
    }

    // MARK:- Actions

}
