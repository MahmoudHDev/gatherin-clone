//
//  ChooseCity+UITextField.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 4/3/23.
//

import UIKit

@available( iOS 13.0 , *)

extension ChooseCityViewController: UITextFieldDelegate {
    
    func setupTextField() {
        self.searchTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        filteredData = citiesArr.filter{
            $0.title.range(of: searchText, options: [.caseInsensitive,.diacriticInsensitive] ) != nil
        }
        citiesTableView.reloadData()

        return true
    }
    
}
