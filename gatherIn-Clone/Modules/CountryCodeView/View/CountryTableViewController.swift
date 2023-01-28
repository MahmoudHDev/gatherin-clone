//
//  CountryTableViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/28/23.
//

import UIKit
import PhoneNumberKit

class CountryTableViewController: UITableViewController {
    //MARK:- Properties
    let arrCountries = PhoneNumberKit().allCountries()
    
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        title = "Country code"
        let done = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backButton))
        navigationItem.setLeftBarButton(done, animated: true)
        
    }
    // MARK:- Methods
    
    private func setupTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc private func backButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrCountries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrCountries[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // send it the previous viewController
        self.dismiss(animated: true, completion: nil)
    }
    

}
