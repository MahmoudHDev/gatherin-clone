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
    
    func setupFSpagerView() {
        firstPagerView.register(FirstFSPagerViewCell.nib(), forCellWithReuseIdentifier: FirstFSPagerViewCell.id)
        firstPagerView.dataSource  = self
        firstPagerView.delegate    = self
        firstPagerView.transformer = FSPagerViewTransformer(type: .overlap)
        firstPagerView.itemSize    = CGSize(width: 250, height: 120)
        firstPagerView.automaticSlidingInterval = 4.0
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
        let cell = firstPagerView.dequeueReusableCell(withReuseIdentifier: FirstFSPagerViewCell.id, at: index) as! FirstFSPagerViewCell
        let images = firstArr[index]
        cell.imageView?.image = images
        return cell
        
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        print("the index in the fspagerViewCell is \(index)")
        self.firstPagerView.scrollToItem(at: index, animated: true)
        self.firstPagerView.deselectItem(at: index, animated: true)
    }
    
}
