//
//  ConversationsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit

class ConversationsViewController: UIViewController, LocalizationProtocol {
    
    // MARK:- Properties
    var arrRecentChat = [RecentMessagesModel]()
    
    // MARK:- Outlets
    @IBOutlet weak var noChatImg             : UIImageView!
    @IBOutlet weak var noChatLbl             : UILabel!
    @IBOutlet weak var searchTextField       : UITextField!
    @IBOutlet weak var conversationTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationControllerStyle()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupTableView()
        self.setupTextField()
        self.localizationForButtons()
        self.localizationForLabels()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.hideKeyboardWhenTappedAround()
    }
    
    private func navigationControllerStyle() {
        title = NSLocalizedString("Conversations", comment: "")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "purpleButton")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
    
    func localizationForButtons() {
        
    }
    
    func localizationForLabels() {
        noChatLbl.text = NSLocalizedString("NoRecentChats", comment: "")
        searchTextField.placeholder = NSLocalizedString("Search", comment: "")
    }

}
