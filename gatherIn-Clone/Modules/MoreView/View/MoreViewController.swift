//
//  MoreViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit

class MoreViewController: UIViewController {

    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var moreTableView: UITableView!
    
    // MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
    }
    
    // MARK: Methods
}
