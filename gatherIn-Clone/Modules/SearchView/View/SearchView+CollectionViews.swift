//
//  SearchView+CollectionViews.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit
import FSPagerView

@available (iOS 13, *)

extension SearchViewController: UICollectionViewDataSource ,UICollectionViewDelegate {
    
    func setupCollectionView() {
        secondCollectionView.dataSource = self
        secondCollectionView.delegate   = self
        secondCollectionView.register(SecondCollectionViewCell.nib(), forCellWithReuseIdentifier: SecondCollectionViewCell.id)
        
        thirdCollectionView.dataSource  = self
        thirdCollectionView.delegate    = self
        thirdCollectionView.register(ThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: ThirdCollectionViewCell.id)
        
        fourthCollectionView.dataSource = self
        fourthCollectionView.delegate   = self
        fourthCollectionView.register(FourthCollectionViewCell.nib(), forCellWithReuseIdentifier: FourthCollectionViewCell.id)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case secondCollectionView:
            return 2
        case thirdCollectionView:
            return 3
        case fourthCollectionView:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case secondCollectionView:
            let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.id, for: indexPath) as! SecondCollectionViewCell
            return cell
        case thirdCollectionView:
            let cell = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.id, for: indexPath) as! ThirdCollectionViewCell
            return cell
        case fourthCollectionView:
            let cell = fourthCollectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.id, for: indexPath) as! FourthCollectionViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

@available (iOS 13, *)

extension SearchViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    /*
     func setTimer() {
         let timer = Timer(timeInterval: 3.0, target: self, selector: #selector(timerSlideShow), userInfo: .none, repeats: true)
         
     }
     
     @objc func timerSlideShow() {
         firstCounter += 1
         // Move the index to the second Index
         
         let indexPath = FSPagerView.index(ofAccessibilityElement: firstCounter + 1)
         print("the counter is in \(indexPath)")
         firstCollectionView.scrollToItem(at: indexPath, animated: true)
         // increase the counter by 1
         
         
     }

     */
    
    func setupFSpagerView() {
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
        firstCollectionView.transformer = FSPagerViewTransformer(type: .overlap)
        firstCollectionView.itemSize = CGSize(width: 250, height: 120)
        firstCollectionView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FirstCollectionView")
    }
    
    func addData() {
        self.firstArr.append(UIImage(named: "Pyramids")!)
        self.firstArr.append(UIImage(named: "DownTown")!)
        self.firstArr.append(UIImage(named: "Sharm El-Sheikh")!)
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return firstArr.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionView", at: index)
        let images = firstArr[index]
        cell.imageView?.image = images
        return cell
        
    }
    
    
}
