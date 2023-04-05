//
//  Vacation+UITableView.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/18/23.
//

import UIKit
@available( iOS 13.0 , *)

extension ChooseCityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableViewConfig() {
        self.addCitiesData()
        print(citiesArr)
        self.citiesTableView.dataSource   = self
        self.citiesTableView.delegate     = self
        self.citiesTableView.register(ChooseCityTableViewCell.nib(), forCellReuseIdentifier: ChooseCityTableViewCell.id)
        self.citiesTableView.separatorStyle = .none
    }
    
    func addCitiesData() {
        self.citiesArr.append(ChooseCityModel(title: NSLocalizedString("House", comment: "")))
        self.citiesArr.append(ChooseCityModel(title: NSLocalizedString("Villa", comment: "")))
        self.citiesArr.append(ChooseCityModel(title: NSLocalizedString("Chaleet", comment: "")))
        self.citiesArr.append(ChooseCityModel(title: NSLocalizedString("Village", comment: "")))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = citiesTableView.dequeueReusableCell(withIdentifier: ChooseCityTableViewCell.id, for: indexPath) as! ChooseCityTableViewCell
//        cell.title.text = citiesArr[indexPath.row].title
        return cell
    }
    
    
}
