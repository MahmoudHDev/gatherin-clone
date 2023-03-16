//
//  MoreVC+TableView.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/16/23.
//
 
import UIKit

@available(iOS 13, *)
extension MoreViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func setupTableView() {
        self.moreTableView.dataSource = self
        self.moreTableView.delegate = self
        self.moreTableView.register(FirstMoreTableViewCell.nib(), forCellReuseIdentifier: FirstMoreTableViewCell.id)
        self.moreTableView.register(SecondMoreTableViewCell.nib(), forCellReuseIdentifier: SecondMoreTableViewCell.id)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return basicTitle.count
        }else{
            return optionListModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = moreTableView.dequeueReusableCell(withIdentifier: FirstMoreTableViewCell.id, for: indexPath) as! FirstMoreTableViewCell
            let title = basicTitle[indexPath.row].title
            let subTitle = basicTitle[indexPath.row].subTitle
            
            cell.setupCell(title: title, subTitle: subTitle)
            return cell
        }else{
            let cell = moreTableView.dequeueReusableCell(withIdentifier: SecondMoreTableViewCell.id, for: indexPath) as! SecondMoreTableViewCell
            let title = optionListModel[indexPath.row].title
            let img = optionListModel[indexPath.row].img
            cell.setupCell(img: img, title: title, chevronImg: UIImage(systemName: "chevron.right")!)
            return cell
        }
    }
    
}
