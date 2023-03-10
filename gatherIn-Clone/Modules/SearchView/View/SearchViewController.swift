//
//  HomeViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit
import DWAnimatedLabel
import FSPagerView

@available (iOS 13, *)
class SearchViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var TopTabBarView            : UIView!
    @IBOutlet weak var greetingLbl              : UILabel!
    @IBOutlet weak var quotesLbl                : UILabel!
    @IBOutlet weak var firstPagerView           : FSPagerView!
    @IBOutlet weak var whereToLbl               : UILabel!
    @IBOutlet weak var searchContainerView      : UIView!
    @IBOutlet weak var textInLbl                : DWAnimatedLabel!
    @IBOutlet weak var yourSecondHomeLbl        : UILabel!
    @IBOutlet weak var secondHomeParagraphLbl   : UILabel!
    @IBOutlet weak var secondPagerView          : FSPagerView!
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
    var username            = ""       // For TopTabBar Greeting
    var firstCounter        = 0
    var firstArr            = [UIImage]()
    var placesModel         = [PlacesModel]()
    var urbansModel         = [PlacesModel]()
    var advantagesModel     = [AdvantagesModel]()
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        textInLbl.text = "Check out the most beautiful places in Egypt"
        textInLbl.animationType = .fade
        textInLbl.placeHolderColor = .darkGray
        textInLbl.startAnimation(duration: 7.0, nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupCollectionView()
        self.setupFirstFSpagerView()
        self.setupSecondFSPagerView()
        self.addDataToFirstFSPagerView()
        self.addDataToSecondFSPagerView()
        self.addDataToThirdCollectionView()
        self.addDataToFourthCollectionView()
        self.buttonStyles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        secondPagerView.scrollToItem(at: 1, animated: true)
        
    }
    // MARK:- Methods
    private func buttonStyles() {
        leftOfferButton .layer.masksToBounds = true
        rightOfferButton.layer.masksToBounds = true
        
        leftOfferButton.clipsToBounds        = true
        rightOfferButton.clipsToBounds       = true
        
        leftOfferButton.layer.maskedCorners  = [.layerMaxXMinYCorner]
        rightOfferButton.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    // MARK:- Actions
    @IBAction func leftButton(_ sender: UIButton) {
        print("Left offer")
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        print("Right offer")

    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        print("Register Button")
    }
    
}
