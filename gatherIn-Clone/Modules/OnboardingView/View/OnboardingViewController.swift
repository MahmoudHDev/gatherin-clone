//
//  OnboardingViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/22/23.
//

import UIKit
@available(iOS 13, *)

class OnboardingViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var collectionView   : UICollectionView!
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
            let indexPath = IndexPath(item: currentCell + 1, section: 0)
            currentCell += 1
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            if currentCell == 2 {
                nextBtn.setTitle("Login", for: .normal)
                saveOnBoardingToDefaults()
                self.showMainVC()

            }

        }else{
            currentCell = 0
            let indexPath = IndexPath(item: 0, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
        
    }
    
    private func saveOnBoardingToDefaults() {
        onboardingSeenByUser = true
        self.defaults.setValue(onboardingSeenByUser, forKey: "HasSeenOnBoarding")

    }
    
    private func showMainVC() {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainView") as! MainViewController
        let navControl = UINavigationController()
        
        navControl.modalPresentationStyle = .fullScreen
        navControl.pushViewController(mainVC, animated: true)
        
        self.dismiss(animated: true, completion: nil)
        self.present(navControl, animated: true, completion: nil)

    }

}

// MARK:- CollectionView
@available(iOS 13, *)

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
}

@available(iOS 13, *)

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    private func setupCollectionView() {
        self.collectionView.register(OnboardingCVC.nib(), forCellWithReuseIdentifier: OnboardingCVC.id)
        self.collectionView.dataSource  = self
        self.collectionView.delegate    = self
        self.collectionView.backgroundColor = .systemBlue
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCVC.id, for: indexPath) as! OnboardingCVC
        cell.contentView.frame = cell.bounds
        
        let Imgs = self.arrImgs[indexPath.row]
        cell.setupCell(img: Imgs)
        return cell
    }
    
}
