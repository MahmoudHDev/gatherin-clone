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
class SearchViewController: UIViewController, LocalizationProtocol {
    
    // MARK:- Outlets
    @IBOutlet weak var cotainerScrollView       : UIScrollView!
    @IBOutlet weak var TopTabBarView            : TopBar!
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
    var username            = ""       // For TopTabBar Greeting
    var firstCounter        = 0
    var firstArr            = [UIImage]()
    var placesModel         = [PlacesModel]()
    var urbansModel         = [PlacesModel]()
    var advantagesModel     = [AdvantagesModel]()
    var counter             : Int = 0
    var collectionViewTimer : Int = 0
    var timer = Timer()
    var lastContentOffset   : CGFloat = 0

    var reachabilityCheck: Bool  {
        if Reachability.isConnectedToNetwork() {
            print("Network is connected")
            return Reachability.isConnectedToNetwork()
        }else{
            print("Network is not connected")
            return Reachability.isConnectedToNetwork()
        }
        
    }
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.cotainerScrollView.delegate = self
        
        self.searchBoxStyle()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupCollectionView()
        self.addDataToFirstCollectionView()
        self.addDataToSecondCollectionView()
        self.addDataToThirdCollectionView()
        self.addDataToFourthCollectionView()
        self.localizationForLabels()
        self.localizationForButtons()
        self.buttonStyles()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
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
    
    func localizationForButtons() {
        registerHostingBtn.setTitle(NSLocalizedString("Register", comment: ""), for: .normal)
    }
    
    func localizationForLabels() {
        greetingLbl.text            = NSLocalizedString("GoodMorning", comment: "") + " Username"
        quotesLbl  .text            = NSLocalizedString("WishUHappyDay", comment: "")
        whereToLbl.text             = NSLocalizedString("WhereTo", comment: "")
        yourSecondHomeLbl.text      = NSLocalizedString("UrSecondHome", comment: "")
        secondHomeParagraphLbl.text = NSLocalizedString("WhereverYourDest", comment: "")
        moreThan35Lbl.text          = NSLocalizedString("MoreThanHouses", comment: "")
        moreThan35ParagraphLbl.text = NSLocalizedString("MoreThanHouseDesc", comment: "")
        hostingLbl.text             = NSLocalizedString("HostWithUs", comment: "")
        hostingParagraphLbl.text    = NSLocalizedString("HostWithUsDesc", comment: "")
        licenseLBl.text             = NSLocalizedString("Licence", comment: "")
        advantagesLbl.text          = NSLocalizedString("OurAdv", comment: "")
    }

    
    private func searchBoxStyle() {
        textInLbl.text = NSLocalizedString("Search", comment: "")
        var timer = Timer()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(repeatingText), userInfo: nil, repeats: true)
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchTextHasBeenTapped))
        
        textInLbl.isUserInteractionEnabled = true
        
        textInLbl.addGestureRecognizer(tapGesture)
    }
    
    @objc private func repeatingText() {
        
        let arrStrings = [NSLocalizedString("CHECKOUT-PLACES", comment: ""),
                          NSLocalizedString("GET-BEST-PRICE", comment: ""),
                          NSLocalizedString("EXPLORE-EGYPT", comment: "")]
        
        if counter != arrStrings.count {
            textInLbl.text = arrStrings[counter]
            textInLbl.animationType = .fade
            textInLbl.placeHolderColor = .darkGray
            textInLbl.startAnimation(duration: 7.0, nil)
        }else{
            counter = 0
            textInLbl.text = arrStrings[counter]
            textInLbl.animationType = .fade
            textInLbl.placeHolderColor = .darkGray
            textInLbl.startAnimation(duration: 7.0, nil)
        }
        counter += 1
    }
    
    @objc private func searchTextHasBeenTapped(){
        let storyBoard = UIStoryboard(name: "Cities", bundle: nil).instantiateViewController(withIdentifier: "CitiesViewController") as! CitiesViewController
        let navController = UINavigationController(rootViewController: storyBoard)
        navController.navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        self.present(navController, animated: true, completion: nil)
        print("Present Cities View")
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


// MARK:- SearchViewController + ScrollViewDelegate
@available(iOS 13, *)

extension SearchViewController: UIScrollViewDelegate {
    // to hide a specific View in case user scrolled Down

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > lastContentOffset {
            // scrolling up
            print("Scrolling Up")

        } else {
            // scrolling down
            print("Scrolling Down")
        }
        lastContentOffset = scrollView.contentOffset.y

    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if firstCollectionView == scrollView as? UICollectionView,
           let layout = firstCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            let cellWidth = layout.itemSize.width + layout.minimumLineSpacing
            let contentOffSet = targetContentOffset.pointee.x
            let index = round(contentOffSet / cellWidth)
            let newOffSet = CGPoint(x: index * cellWidth, y: 0 )
            targetContentOffset.pointee = newOffSet
            
        }
    }
}
