//
//  BasicInformationViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/11/23.
//

import UIKit
import Firebase


@available(iOS 13, *)

class BasicInformationViewController: UIViewController, InterfaceStyleProtocol {
    // MARK:- Outlets
    @IBOutlet weak var firsParagraph        : UILabel!
    @IBOutlet weak var nameLbl              : UILabel!
    @IBOutlet weak var nameTextField        : UITextField!
    @IBOutlet weak var nameContainerView    : UIView!
    @IBOutlet weak var nameErrorLbl         : UILabel!
    @IBOutlet weak var emailLbl             : UILabel!
    @IBOutlet weak var emailContainerView   : UIView!
    @IBOutlet weak var emailTextField       : UITextField!
    @IBOutlet weak var emailErrorLbl        : UILabel!
    @IBOutlet weak var registerButton       : UIButton!
    @IBOutlet weak var lastParagraph        : UILabel!
    
    // MARK:- Properties
    let defaults   = UserDefaults.standard
    var isRegisterd: Bool = false
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.textHyperLink()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.textFieldConfig()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    // MARK:- Methods
    func uiStyle() {
        self.nameContainerView.layer.masksToBounds = false
        self.emailContainerView.layer.masksToBounds = false
        self.registerButton.layer.masksToBounds = false
    }
    
    private func textHyperLink() {
        let atributedString = NSMutableAttributedString(string: "When you create an account on gathern. You accept our Privacy & Policy and the Terms & Conditions.")
        let firstRange = (atributedString.string as NSString).range(of: "Privacy & Policy")
        let secondRange = (atributedString.string as NSString).range(of: "Terms & Conditions")
        
        atributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: firstRange)
        atributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: secondRange)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(privacyAndPolicy))
        lastParagraph.attributedText = atributedString
        lastParagraph.addGestureRecognizer(tapRecognizer)
    }
    
    @objc
    private func privacyAndPolicy() {
        print("View the Privacy and The Policy")
    }
    
    func presentHomeVC() -> UIViewController {
        let homeVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        var arrViewControllers = [UIViewController]()

        let searchVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        let searchTab = UITabBarItem(title: "Search", image: HomeIcons.search!.resize(to: CGSize(width: 25, height: 25)), selectedImage: HomeIcons.search!.resize(to: CGSize(width: 25, height: 25)))
        searchVC.tabBarItem = searchTab
        
        let myBookingsVC = UIStoryboard(name: "MyBookings", bundle: nil).instantiateViewController(withIdentifier: "MyBookingsViewController") as! MyBookingsViewController
        let myBookingsTab = UITabBarItem(title: "My Bookings", image: HomeIcons.reservations!.resize(to: CGSize(width: 25, height: 25)), selectedImage: HomeIcons.reservations!.resize(to: CGSize(width: 25, height: 25)))
        myBookingsVC.tabBarItem = myBookingsTab
        
        let favoiriteVC = UIStoryboard(name: "Favorite", bundle: nil).instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        let favoiriteTab = UITabBarItem(title: "favorite", image: HomeIcons.favorite!.resize(to: CGSize(width: 25, height: 25)), selectedImage: HomeIcons.favorite!.resize(to: CGSize(width: 25, height: 25)))
        favoiriteVC.tabBarItem = favoiriteTab

        let conversationVC = UIStoryboard(name: "Conversations", bundle: nil).instantiateViewController(withIdentifier: "ConversationsViewController") as! ConversationsViewController
        let conversationTab = UITabBarItem(title: "Conversations", image: HomeIcons.conversation!.resize(to: CGSize(width: 25, height: 25)), selectedImage: HomeIcons.conversation!.resize(to: CGSize(width: 25, height: 25)))
        conversationVC.tabBarItem = conversationTab

        let moreVC = UIStoryboard(name: "More", bundle: nil).instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
        let moreTab = UITabBarItem(title: "More", image: HomeIcons.more!.resize(to: CGSize(width: 25, height: 25)), selectedImage: HomeIcons.more!.resize(to: CGSize(width: 25, height: 25)))
        moreVC.tabBarItem = moreTab
        
        arrViewControllers.append(UINavigationController(rootViewController: searchVC))
        arrViewControllers.append(UINavigationController(rootViewController: myBookingsVC))
        arrViewControllers.append(UINavigationController(rootViewController: favoiriteVC))
        arrViewControllers.append(UINavigationController(rootViewController: conversationVC))
        arrViewControllers.append(UINavigationController(rootViewController: moreVC))

        homeVC.viewControllers = arrViewControllers
        homeVC.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true)
        return homeVC
    }
    // MARK:- Actions
    @IBAction func registerBtn(_ sender: UIButton) {
        // If textfields {}
        self.isRegisterd = true
        defaults.set(isRegisterd, forKey: "isRegistered")
        // send the data to the firebase
        print("Register and view the new viewController")
        self.present(presentHomeVC(), animated: true)
    }
    

    
}
