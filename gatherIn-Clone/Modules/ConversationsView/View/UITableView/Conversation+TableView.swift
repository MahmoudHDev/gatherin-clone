//
//  Conversation+TableView.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/21/23.
//

import UIKit

extension ConversationsViewController: UITableViewDataSource, UITableViewDelegate {

    func setupTableView() {
        if arrRecentChat.count == 0 {
            conversationTableView.isHidden = true
        }else{
            conversationTableView.isHidden = false

        }
        
        self.conversationTableView.dataSource = self
        self.conversationTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrRecentChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = conversationTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
