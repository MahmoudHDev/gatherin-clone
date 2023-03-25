//
//  MoreViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit

@available ( iOS 13, *)
class MoreViewController: UIViewController {

    // MARK: Properties
    var optionListModel = [OptionListModel]()
    var basicTitle      = [BasicTitle]()
    
    // MARK: Outlets
    @IBOutlet weak var moreTableView: UITableView!
    
    // MARK: View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationControllerStyle()
        self.setupTableView()
        self.loadData()
    }
    
    // MARK: Methods
    
    private func navigationControllerStyle() {
        self.title = "More"
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "purpleButton")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        backButton.style = .plain
        backButton.tintColor = .white
        self.navigationItem.backBarButtonItem = backButton
    }
    
    private func loadData() {
        self.optionListModel.append(OptionListModel(img: SymbolsList.profile!, title: "Profile"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.walletLog!, title: "Wallet Log"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.rateUs!, title: "Rate Us"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.hostWithUs!, title: "Host with us"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.paymentOptions!, title: "Payment Options"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.contactUs!, title: "Contact us"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.inviteAFriend!, title: "Invite a friend"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.repeatedInquiry!, title: "Repeated questions"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.termsOfUse!, title: "Terms of use"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.privacyPolicy!, title: "Privacy Policy"))
        self.optionListModel.append(OptionListModel(img: SymbolsList.language!, title: NSLocalizedString("ChangeLanguage", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.logout!, title: "logout"))

        self.basicTitle.append(BasicTitle(title: "Number of reservations", subTitle: "0"))
        self.basicTitle.append(BasicTitle(title: "Wallet Credit", subTitle: "0 L.E"))
        self.basicTitle.append(BasicTitle(title: "Rating (from hosters)", subTitle: "10/0.0 (0)"))
        self.basicTitle.append(BasicTitle(title: "Hosters Blocked you", subTitle: "0"))

    }
    
    
}
