//
//  CitiesViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/16/23.
//

import UIKit

class CitiesViewController: UIViewController {

    // MARK:- Propeties
    var arrCities           = [String]()
    var filteredData        = [String]()
    var userSerached:Bool   = false
    // MARK:- Outlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var citiesTableView: UITableView!
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewStyle()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupTableView()
        self.setupTextFieldDelegate()
        
    }
    // MARK:- Methods
    private func viewStyle() {
        let leftButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissButton(_:)))
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .clear
    }
    
    // MARK:- Actions
    @objc
    private func dismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}

// CitiesVC + UITextField
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
