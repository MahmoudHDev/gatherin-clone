//
//  HomeViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit
import DWAnimatedLabel


class SearchViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var greetingLbl              : UILabel!
    @IBOutlet weak var quotesLbl                : UILabel!
    @IBOutlet weak var firstCollectionView      : UICollectionView!
    @IBOutlet weak var whereToLbl               : UILabel!
    @IBOutlet weak var searchContainerView      : UIView!
    @IBOutlet weak var textInLbl                : DWAnimatedLabel!
    @IBOutlet weak var yourSecondHomeLbl        : UILabel!
    @IBOutlet weak var secondHomeParagraphLbl   : UILabel!
    @IBOutlet weak var secondCollectionView     : UICollectionView!
    @IBOutlet weak var moreThan35Lbl            : UILabel!
    @IBOutlet weak var moreThan35ParagraphLbl   : UILabel!
    @IBOutlet weak var thirdCollectionView      : UICollectionView!
    @IBOutlet weak var rightOfferButton         : UIButton!
    @IBOutlet weak var leftOfferButton          : UIButton!
    @IBOutlet weak var hostingLbl               : UILabel!
    @IBOutlet weak var hostingParagraphLbl      : UILabel!
    @IBOutlet weak var registerHostingBtn       : UIButton!
    @IBOutlet weak var licenseLBl               : UILabel!
    @IBOutlet weak var advantagesLbl            : UILabel!
    @IBOutlet weak var fourthCollectionView     : UICollectionView!

    
    
    // MARK:- Properties
    var username: String = ""
    
    // MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupCollectionView()
    }
    
    // MARK:- Methods
    @objc
    private func showSaudiCities() {
        // Present the cites View
//    present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    // MARK:- Actions
    @IBAction func leftButton(_ sender: UIButton) {
        
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
    }
}
