//
//  OnboardingViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/22/23.
//

import UIKit
import FSPagerView

@available(iOS 13, *)

class OnboardingViewController: UIViewController, LocalizationProtocol {

    // MARK:- Outlets
    @IBOutlet weak var pageview         : FSPagerView!
    @IBOutlet weak var pageControl      : FSPageControl!
    @IBOutlet weak var skipBtn          : UIButton!
    @IBOutlet weak var nextBtn          : UIButton!
    
    // MARK:- Properties
    var arrImgs = [UIImage]()
    var currentCell = 0
    var onboardingSeenByUser: Bool = false
    let defaults = UserDefaults.standard
    
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.addData()
        self.buttonsStyles()
        self.localizationForButtons()
    }
    
    // MARK:- Methods
    func localizationForButtons() {
        skipBtn.setTitle(NSLocalizedString("Skip", comment: "SkipAndNextBttns"), for: .normal)
    }
    
    func localizationForLabels() {
        print("NoLabels")
    }
    
    private func addData() {
        self.arrImgs.append(UIImage(named: "DownTown")!)
        self.arrImgs.append(UIImage(named: "Luxor")!)
        self.arrImgs.append(UIImage(named: "Siwa")!)
    }
    
    private func buttonsStyles() {
        self.nextBtn.layer.masksToBounds = true
        self.nextBtn.clipsToBounds = false
        self.nextBtn.layer.cornerRadius = 20
    }
    
    // MARK:- Actions
    @IBAction func skipButton(_ sender: UIButton) {
        self.saveOnBoardingToDefaults()
        self.showMainVC()
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        print("Next")
    }
    
    private func saveOnBoardingToDefaults() {
        onboardingSeenByUser = true
        self.defaults.setValue(onboardingSeenByUser, forKey: "HasSeenOnBoarding")
        
    }
    
    private func showMainVC() {
        self.dismiss(animated: true, completion: nil)

        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! MainViewController
        let navControl = UINavigationController()
        
        navControl.modalPresentationStyle = .fullScreen
        navControl.pushViewController(mainVC, animated: true)
        
        self.present(navControl, animated: true, completion: nil)
        
    }
    
}

// MARK:- CollectionView

@available(iOS 13, *)

extension OnboardingViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    
    
    private func setupCollectionView() {
        self.pageview.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.pageview.dataSource  = self
        self.pageview.delegate    = self
        self.pageview.transformer = FSPagerViewTransformer(type: .depth)
        self.pageview.backgroundColor = .white
        self.pageControl.numberOfPages = arrImgs.count
        self.pageControl.setFillColor(.systemGray, for: .normal)
        self.pageControl.setStrokeColor(.systemBlue, for: .selected)
        self.pageControl.currentPage = 0
        
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return arrImgs.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.image = self.arrImgs[index]
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        self.pageControl.currentPage = index
        print(index)
        if index == arrImgs.count - 1 {
            self.skipBtn.backgroundColor = .black
            self.skipBtn.layer.cornerRadius = 22
            self.skipBtn.layer.masksToBounds = false
            self.skipBtn.setTitle(NSLocalizedString("GettingStarted", comment: "SkipAndNextBttns"), for: .normal)
            self.skipBtn.setTitleColor(.white, for: .normal)
            print("Get Started")
        }else{
            self.skipBtn.backgroundColor = .white
            self.skipBtn.layer.cornerRadius = 22
            self.skipBtn.setTitleColor(.darkGray, for: .normal)
            self.skipBtn.setTitle(NSLocalizedString("Skip", comment: "SkipAndNextBttns"), for: .normal)
        }
    }
}
