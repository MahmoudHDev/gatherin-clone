//
//  SearchView+CollectionViews.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit
import FSPagerView

@available (iOS 13, *)

    // MARK:- UICollectionView DataSource & Delegate

extension SearchViewController: UICollectionViewDataSource ,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        thirdCollectionView.dataSource  = self
        thirdCollectionView.delegate    = self
        thirdCollectionView.register(ThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: ThirdCollectionViewCell.id)

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .horizontal
        thirdCollectionView.collectionViewLayout = layout
        
        
        fourthCollectionView.dataSource = self
        fourthCollectionView.delegate   = self
        fourthCollectionView.register(FourthCollectionViewCell.nib(), forCellWithReuseIdentifier: FourthCollectionViewCell.id)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case thirdCollectionView:
            return 10
        case fourthCollectionView:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case thirdCollectionView:
            let cell = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.id, for: indexPath) as! ThirdCollectionViewCell
            cell.image.image = UIImage(named: "Pyramids-2")
            return cell
        case fourthCollectionView:
            let cell = fourthCollectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.id, for: indexPath) as! FourthCollectionViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case thirdCollectionView:
            return CGSize(width: 150 , height: 200)
        case fourthCollectionView:
            return CGSize(width: 130, height: 130)
        default:
            return CGSize(width: 100, height: 100)
        }
    }
    
    
    
}

    // MARK:- FSPagerView   DataSource & Delegate

@available (iOS 13, *)

extension SearchViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    
    func setupFirstFSpagerView() {
        firstPagerView.register(FirstFSPagerViewCell.nib(), forCellWithReuseIdentifier: FirstFSPagerViewCell.id)
        firstPagerView.dataSource  = self
        firstPagerView.delegate    = self
        firstPagerView.transformer = FSPagerViewTransformer(type: .overlap)
        firstPagerView.itemSize    = CGSize(width: 250, height: 120)
        firstPagerView.automaticSlidingInterval = 4.0
    }
    
    func setupSecondFSPagerView() {
        secondPagerView.register(SecondFSPagerViewCell.nib(), forCellWithReuseIdentifier: SecondFSPagerViewCell.id)
        secondPagerView.dataSource = self
        secondPagerView.delegate   = self
        secondPagerView.interitemSpacing = 5
        secondPagerView.itemSize = CGSize(width: 150, height: 150)
    }
    
    func addDataToFirstFSPagerView() {
        self.firstArr.append(UIImage(named: "Pyramids")!)
        self.firstArr.append(UIImage(named: "DownTown")!)
        self.firstArr.append(UIImage(named: "Sharm El-Sheikh")!)
    }
    
    func addDataToSecondFSPagerView() {
        self.placesModel.append(PlacesModel(image: UIImage(named: "House")!, title: "House"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Villa")!, title: "Villa"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Chaleet")!, title: "Chaleet"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Villages")!, title: "Villages"))
    }
    
    func addDataToThirdFSPagerView() {
        self.placesModel.append(PlacesModel(image: UIImage(named: "Cairo")!, title: "Cairo"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Pyramids-2")!, title: "Giza"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Alexandria")!, title: "Alexandria"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Portsaid")!, title: "Port Said"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Sharm")!, title: "Sharm El-Sheikh"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Hurghada")!, title: "Hurghada"))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Siwa")!, title: "Siwa Oasis"))

    }
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        switch pagerView {
        case firstPagerView:
            return firstArr.count
        case secondPagerView:
            print("the count of places model is: \(placesModel.count)")
            return placesModel.count
        default:
            return 0
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        switch pagerView {
        case firstPagerView:
            let cell = firstPagerView.dequeueReusableCell(withReuseIdentifier: FirstFSPagerViewCell.id, at: index) as! FirstFSPagerViewCell
            let images = firstArr[index]
            cell.imageView?.image = images
            return cell
        case secondPagerView:
            let cell = secondPagerView.dequeueReusableCell(withReuseIdentifier: SecondFSPagerViewCell.id, at: index) as! SecondFSPagerViewCell
            let images = placesModel[index].image
            let titles = placesModel[index].title
            cell.setupCell(image: images, title: titles)
            print("the secondPagerViewCells Index in: \(index)")

            return cell
            
        default:
            return FSPagerViewCell()
        }
        
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        switch pagerView {
        case firstPagerView:
            print("the index in the fspagerViewCell is \(index)")
            self.firstPagerView.scrollToItem(at: index, animated: true)
            self.firstPagerView.deselectItem(at: index, animated: true)
        case secondPagerView:
            print("the index in the fspagerViewCell is \(index)")
            self.secondPagerView.scrollToItem(at: index, animated: true)
            self.secondPagerView.deselectItem(at: index, animated: true)
        default:
            print("Nothing")
        }

    }
    
}
