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
        self.title = NSLocalizedString("More", comment: "")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "purpleButton")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let backButton = UIBarButtonItem()
        backButton.title = NSLocalizedString("Back", comment: "")
        backButton.style = .plain
        backButton.tintColor = .white
        self.navigationItem.backBarButtonItem = backButton
    }
    
    private func loadData() {
        self.optionListModel.append(OptionListModel(img: SymbolsList.profile!, title: NSLocalizedString("Profile", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.walletLog!, title: NSLocalizedString("WalletLog", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.rateUs!, title: NSLocalizedString("RateUs", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.hostWithUs!, title: NSLocalizedString("HostWith", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.paymentOptions!, title: NSLocalizedString("PaymentOptions", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.contactUs!, title: NSLocalizedString("ContactUs", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.inviteAFriend!, title: NSLocalizedString("InviteAFriend", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.repeatedInquiry!, title: NSLocalizedString("RepeatedQuestions", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.termsOfUse!, title: NSLocalizedString("TermsOfUse", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.privacyPolicy!, title: NSLocalizedString("PrivacyPolicy", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.language!, title: NSLocalizedString("ChangeLanguage", comment: "")))
        self.optionListModel.append(OptionListModel(img: SymbolsList.logout!, title: NSLocalizedString("Logout", comment: "")))

        self.basicTitle.append(BasicTitle(title: NSLocalizedString("NoOfReservations", comment: ""), subTitle: "0"))
        self.basicTitle.append(BasicTitle(title: NSLocalizedString("WalletCredit", comment: ""), subTitle: "0 L.E"))
        self.basicTitle.append(BasicTitle(title: NSLocalizedString("RatingFromHosters", comment: ""), subTitle: "10/0.0 (0)"))
        self.basicTitle.append(BasicTitle(title: NSLocalizedString("HostersBlockedYou", comment: ""), subTitle: "0"))

    }
    
    
}
