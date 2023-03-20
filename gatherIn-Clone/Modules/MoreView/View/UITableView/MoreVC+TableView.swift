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
            cell.isUserInteractionEnabled = false
            let title = basicTitle[indexPath.row].title
            let subTitle = basicTitle[indexPath.row].subTitle
            
            cell.setupCell(title: title, subTitle: subTitle)
            return cell
        }else{
            let cell = moreTableView.dequeueReusableCell(withIdentifier: SecondMoreTableViewCell.id, for: indexPath) as! SecondMoreTableViewCell
            cell.isUserInteractionEnabled = true
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
        switch indexPath.row {
        case 0:
            let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
            self.navigationController?.pushViewController(profileVC, animated: true)
        case 1:
            let walletLogVC = UIStoryboard(name: "WalletLog", bundle: nil).instantiateViewController(withIdentifier: "WalletLog") as! WalletLogViewController
            self.navigationController?.pushViewController(walletLogVC, animated: true)
        case 2:
            print("Rate Us!")
        case 3:
            print("Host With Us")
        case 4:
            let paymentMethods = UIStoryboard(name: "PaymentMethods", bundle: nil).instantiateViewController(withIdentifier: "PaymentMethods") as! PaymentMethodsViewController
            self.navigationController?.pushViewController(paymentMethods, animated: true)
        case 5:
            let contactUsView = UIStoryboard(name: "ContactUs", bundle: nil).instantiateViewController(withIdentifier: "ContactUs") as! ContactUsViewController
            self.navigationController?.pushViewController(contactUsView, animated: true)
        case 6:
            print("Invite a friend")
        case 7:
            print("Repeated Questions")
        case 8:
            let termsOfUse = UIStoryboard(name: "TermsOfUse", bundle: nil).instantiateViewController(withIdentifier: "TermsOfUse") as! TermsOfUseViewController
            self.navigationController?.pushViewController(termsOfUse, animated: true)
        case 9:
            let privacyPolicyView = UIStoryboard(name: "PrivacyPolicy", bundle: nil).instantiateViewController(withIdentifier: "PrivacyPolicy") as! PrivacyPolicyViewController
            self.navigationController?.pushViewController(privacyPolicyView, animated: true)
            print("")
        case 10:
            let changeLanguageView = UIStoryboard(name: "ChangeLanguage", bundle: nil).instantiateViewController(withIdentifier: "ChangeLanguage") as! ChangeLanguageViewController
            self.navigationController?.pushViewController(changeLanguageView, animated: true)
        default:
            print("Logout")
        }
        moreTableView.deselectRow(at: indexPath, animated: true)
    }
}
