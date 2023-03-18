//
//  MoreVC+TableView.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/16/23.
//
 
import UIKit

@available(iOS 13, *)
extension MoreViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    
    func setupTableView() {
        self.moreTableView.dataSource   = self
        self.moreTableView.delegate     = self
        self.moreTableView.register(FirstMoreTableViewCell.nib(), forCellReuseIdentifier: FirstMoreTableViewCell.id)
        self.moreTableView.register(SecondMoreTableViewCell.nib(), forCellReuseIdentifier: SecondMoreTableViewCell.id)
        self.moreTableView.separatorStyle = .none
        self.moreTableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
            let img = optionListModel[indexPath.row].img.resize(to: CGSize(width: 20, height: 20)).withTintColor(UIColor(named: "purpleButton")!)
            
            cell.setupCell(img: img, title: title, chevronImg: UIImage(systemName: "chevron.right")!)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(40)
        }else{
            return CGFloat(50)
        }
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 0.5))
        
        footerView.backgroundColor = .gray
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 0.5
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(basicTitle[indexPath.row])
        }else{
            print(optionListModel[indexPath.row])
        }
    }
    
}
