//
//  OnboardingViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/22/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var collectionView   : UICollectionView!
    @IBOutlet weak var skipBtn          : UIButton!
    @IBOutlet weak var nextBtn          : UIButton!
    
    // MARK:- Properties
    var arrImgs = [UIImage]()
    var currentCell = 0
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
        // Skip and present the new viewController and dissmiss the previous
        print("Skip.")
        print("present next ViewController")
        
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        self.nextBtn.setTitle("Next", for: .normal)
        if currentCell < 2 {
            let indexPath = IndexPath(item: currentCell + 1, section: 0)
            currentCell += 1
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            if currentCell == 2 {
                nextBtn.setTitle("Login", for: .normal)
            }
        }else{
            currentCell = 0
            let indexPath = IndexPath(item: 0, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
        
    }
    
}

// MARK:- CollectionView

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
}


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
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if currentCell == 2  {
            print("Last one")
        }
        
    }
    
    
}

