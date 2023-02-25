//
//  OnboardingViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/22/23.
//

import UIKit
import FSPagerView

@available(iOS 13, *)

class OnboardingViewController: UIViewController {
    
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
    }
    
    // MARK:- Methods
    private func addData() {
        self.arrImgs.append(UIImage(named: "First")!)
        self.arrImgs.append(UIImage(named: "Second")!)
        self.arrImgs.append(UIImage(named: "Third")!)
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
        self.nextBtn.setTitle("Next", for: .normal)
        if currentCell < 2 {
            let indexPath = FSPagerView.index(ofAccessibilityElement: currentCell + 1)
            currentCell += 1
            self.pageview.scrollToItem(at: indexPath, animated: true)
            if currentCell == 2 {
                nextBtn.setTitle("Login", for: .normal)
                saveOnBoardingToDefaults()
                self.showMainVC()
            }
        }else{
            currentCell = 0
            let indexPath = FSPagerView.index(ofAccessibilityElement: 0)
            self.pageview.scrollToItem(at: indexPath , animated: true)
            
        }
    }
    
    private func saveOnBoardingToDefaults() {
        onboardingSeenByUser = true
        self.defaults.setValue(onboardingSeenByUser, forKey: "HasSeenOnBoarding")
        
    }
    
    private func showMainVC() {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! MainViewController
        let navControl = UINavigationController()
        
        navControl.modalPresentationStyle = .fullScreen
        navControl.pushViewController(mainVC, animated: true)
        
        self.dismiss(animated: true, completion: nil)
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
        self.pageview.backgroundColor = UIColor(named: "purpleButton")
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
        cell.imageView?.image = self.arrImgs[index]
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        self.pageControl.currentPage = index
    }
    
    
    
}
