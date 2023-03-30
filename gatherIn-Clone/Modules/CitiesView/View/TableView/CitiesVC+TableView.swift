//
//  CitiesVC+TableView.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/16/23.
//

import UIKit

extension CitiesViewController: UITableViewDataSource, UITableViewDelegate {

    func setupTableView() {
        self.citiesTableView.dataSource = self
        self.citiesTableView.delegate   = self
        self.citiesTableView.register(CitiesTableViewCell.nib(), forCellReuseIdentifier: CitiesTableViewCell.id)
        self.loadData()
    }
    
    func loadData() {
        self.arrCities = [NSLocalizedString("Cairo"     , comment: "Governorate"),
                          NSLocalizedString("Alexandria", comment: "Governorate"),
                          NSLocalizedString("Port Said" , comment: "Governorate"),
                          NSLocalizedString("Sharm El-Shiekh", comment: "Governorate"),
                          NSLocalizedString("Hurghada"  , comment: "Governorate"),
                          NSLocalizedString("Luxor"     , comment: "Governorate"),
                          NSLocalizedString("Aswan"     , comment: "Governorate"),
                          NSLocalizedString("Matrouh"   , comment: "Governorate"),
                          NSLocalizedString("Dakahlia"  , comment: "Governorate"),
                          NSLocalizedString("Sharqia"   , comment: "Governorate")]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }else{
            return arrCities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !filteredData.isEmpty {
            let cell = citiesTableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.id, for: indexPath) as! CitiesTableViewCell
            
            cell.cityName.text = filteredData[indexPath.row]
            return cell
        }else{
            let cell = citiesTableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.id, for: indexPath) as! CitiesTableViewCell
            cell.cityName.text = arrCities[indexPath.row]
            return cell
        }
    }
    
}
