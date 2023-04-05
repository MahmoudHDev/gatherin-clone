//
//  VacationRentalViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/18/23.
//

import UIKit
@available(iOS 13.0, *)
class ChooseCityViewController: UIViewController {
    //MARK:- Properties
    var citiesArr           = [ChooseCityModel]()
    var filteredData        = [ChooseCityModel]()
    var selectedUrban       : PlacesModel?
    //MARK:- Outlets
    @IBOutlet weak var citiesTableView      : UITableView!
    @IBOutlet weak var searchTextField      : UITextField!
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navStyle()
        self.tableViewConfig()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = NSLocalizedString("CHOOSE-CITY", comment: "")
    }
    //MARK:- Methods
    func navStyle() {
        let appeerance = UINavigationBarAppearance()
        appeerance.titleTextAttributes = [.foregroundColor: UIColor.green]
        appeerance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemPurple]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.standardAppearance = appeerance
        navigationController?.navigationItem.scrollEdgeAppearance = appeerance
        let navBarButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(doneButton(_:)))
        navigationController?.navigationItem.backBarButtonItem = navBarButton
    }
    
    @objc func doneButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:- Functions

}
