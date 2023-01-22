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
    // MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.addData()
    }
    
    // MARK:- Methods
    private func addData() {
        self.arrImgs.append(UIImage(named: "First")!)
        self.arrImgs.append(UIImage(named: "Second")!)
        self.arrImgs.append(UIImage(named: "Third")!)
    }
    
    // MARK:- Actions
    @IBAction func skipButton(_ sender: UIButton) {
        // Skip and present the new viewController and dissmiss the previous
        print("Skip.")

    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        // go to next cell
        print("Next")
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
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCVC.id, for: indexPath) as! OnboardingCVC
        let Imgs = self.arrImgs[indexPath.row]
        cell.setupCell(img: Imgs)
        return cell
    }
    
    
    
}
