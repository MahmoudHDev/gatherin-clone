//
//  Vacation+UITableView.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/18/23.
//

import UIKit

extension VacationRentalViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableViewConfig() {
        self.tableView.dataSource   = self
        self.tableView.delegate     = self
        self.tableView.register(VacationRentalTableViewCell.nib(), forCellReuseIdentifier: VacationRentalTableViewCell.id)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vacationRentalsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VacationRentalTableViewCell.id, for: indexPath) as! VacationRentalTableViewCell
        
//        cell.setupCell(img: <#T##UIImage#>, title: <#T##String#>)
        return cell
    }
    
    
}
