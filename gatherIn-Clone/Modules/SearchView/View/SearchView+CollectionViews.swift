//
//  SearchView+CollectionViews.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit

extension SearchViewController: UICollectionViewDataSource ,UICollectionViewDelegate {
    
    func setupCollectionView() {
        firstCollectionView.dataSource = self
        firstCollectionView.delegate = self
        firstCollectionView.register(FirstCollectionViewCell.nib(), forCellWithReuseIdentifier: FirstCollectionViewCell.id)
        
        secondCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.register(SecondCollectionViewCell.nib(), forCellWithReuseIdentifier: SecondCollectionViewCell.id)

        thirdCollectionView.dataSource = self
        thirdCollectionView.delegate = self
        thirdCollectionView.register(ThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: ThirdCollectionViewCell.id)

        fourthCollectionView.dataSource = self
        fourthCollectionView.delegate = self
        fourthCollectionView.register(FourthCollectionViewCell.nib(), forCellWithReuseIdentifier: FourthCollectionViewCell.id)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case firstCollectionView:
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.id, for: indexPath) as! FirstCollectionViewCell
            return cell
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
