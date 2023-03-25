//
//  CountryTableViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/28/23.
//

import UIKit
import PhoneNumberKit
import ContactsUI

protocol CountryDelegate {
    func selectedCoutry(country: String)
}

class CountryTableViewController: UITableViewController {
    //MARK:- Properties
    let arrCountries = PhoneNumberKit().allCountries()
    var delegate : CountryDelegate?
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        title = NSLocalizedString("CountryCode", comment: "")
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
    
    func flag(country code: String) -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for i in code.utf16 {
            usv.append(UnicodeScalar(base + Int(i))!)
        }
        return String(usv)
    }
    
    func filterdCountries(countries: [String]) -> [String] {
        var filtered = [String]()
        
        for i in countries {
            if i != "001" {
                filtered.append(i)
            }
        }
        return filtered
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterdCountries(countries: arrCountries).count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let countries = filterdCountries(countries: arrCountries)[indexPath.row]
        cell.textLabel?.text = "\(flag(country: countries)) \(countries)"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // send it the previous viewController
        let selectedItem = arrCountries[indexPath.row]
        self.delegate?.selectedCoutry(country: selectedItem)
        self.dismiss(animated: true, completion: nil)
    }
    
}
