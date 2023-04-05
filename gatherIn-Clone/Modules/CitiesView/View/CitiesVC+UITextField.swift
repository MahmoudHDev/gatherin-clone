//
//  CitiesVC+UITextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 4/3/23.
//

import UIKit

extension CitiesViewController: UITextFieldDelegate  {

    func setupTextFieldDelegate() {
        searchTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        filteredData = arrCities.filter{
            $0.range(of: searchText, options: [.caseInsensitive,.diacriticInsensitive] ) != nil
        }
        citiesTableView.reloadData()
        return true
    }
    
    
}
