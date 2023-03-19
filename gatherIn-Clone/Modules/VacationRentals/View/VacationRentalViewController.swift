//
//  VacationRentalViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/18/23.
//

import UIKit

class VacationRentalViewController: UIViewController {
    //MARK:- Properties
    var vacationRentalsModel = [VacationRentalsModel]()
    
    //MARK:- Outlets
    @IBOutlet weak var cityAndHouse : UILabel!
    @IBOutlet weak var tableView    : UITableView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewConfig()
        
    }
    //MARK:- Methods

    //MARK:- Functions

}
