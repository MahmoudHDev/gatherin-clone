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
        self.arrCities = ["Cairo", "Alexandria", "Port Said", "Sharm El-Shiekh", "Hurghada", "Luxor", "Aswan", "Matrouh", "Dakahlia", "Sharqia"]
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
