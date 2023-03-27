//
//  ConversationsViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit

class ConversationsViewController: UIViewController {
    // MARK:- Properties
    var arrRecentChat = [RecentMessagesModel]()
    
    // MARK:- Outlets
    @IBOutlet weak var noChatImg: UIImageView!
    @IBOutlet weak var noChatLbl: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conversationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationControllerStyle()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupTableView()
        self.setupTextField()
    }
    
    
    private func navigationControllerStyle() {
        title = NSLocalizedString("Conversations", comment: "")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "purpleButton")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
}
