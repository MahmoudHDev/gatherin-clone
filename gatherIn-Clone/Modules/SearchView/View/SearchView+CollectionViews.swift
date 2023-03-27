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
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .horizontal
        
        thirdCollectionView.dataSource  = self
        thirdCollectionView.delegate    = self
        thirdCollectionView.register(ThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: ThirdCollectionViewCell.id)
        thirdCollectionView.showsHorizontalScrollIndicator = false
        thirdCollectionView.collectionViewLayout = layout
        
        fourthCollectionView.dataSource = self
        fourthCollectionView.delegate   = self
        fourthCollectionView.register(FourthCollectionViewCell.nib(), forCellWithReuseIdentifier: FourthCollectionViewCell.id)
        
        
    }
    
    func addDataToThirdCollectionView() {
        self.placesModel.append(PlacesModel(image: UIImage(named: "Cairo")!         , title: NSLocalizedString("Cairo", comment: "")))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Pyramids-2")!    , title: NSLocalizedString("Giza", comment: "")))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Alexandria")!    , title: NSLocalizedString("Alexandria", comment: "")))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Portsaid")!      , title: NSLocalizedString("PortSaid", comment: "")))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Sharm")!         , title: NSLocalizedString("Sharm", comment: "")))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Hurghada")!      , title: NSLocalizedString("Hurghada", comment: "")))
        self.placesModel.append(PlacesModel(image: UIImage(named: "Siwa")!          , title: NSLocalizedString("Siwa Oasis", comment: "")))
        
    }
    
    
    func addDataToFourthCollectionView() {
        advantagesModel.append(AdvantagesModel(
                                title: NSLocalizedString("Verified", comment: ""),
                                icon: UIImage(systemName: "pencil")!,
                                description: NSLocalizedString("VerifiedDesc", comment: "")))
        
        advantagesModel.append(AdvantagesModel(
                                title: NSLocalizedString("Credibility", comment: ""), icon: UIImage(systemName: "star")!,
                                description: NSLocalizedString("CredibilityDesc", comment: "")))
        
        advantagesModel.append(AdvantagesModel(
                                title: NSLocalizedString("InstantBooking", comment: ""),
                                icon: UIImage(systemName: "doc")!,
                                description: NSLocalizedString("InstantBookingDesc", comment: "")))
        
        advantagesModel.append(AdvantagesModel(
                                title: NSLocalizedString("Options", comment: ""),
                                icon: UIImage(systemName: "magnifyingglass")!,
                                description:NSLocalizedString("OptionsDesc", comment: "")))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case thirdCollectionView:
            return placesModel.count + 1
        case fourthCollectionView:
            return advantagesModel.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case thirdCollectionView:
            if indexPath.row == placesModel.count {
                let cell = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.id, for: indexPath) as! ThirdCollectionViewCell
                cell.title.text = NSLocalizedString("More", comment: "")
                cell.imageContainerView.isHidden = true
                
                return cell
            }else{
                let cell = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.id, for: indexPath) as! ThirdCollectionViewCell
                let titles  = placesModel[indexPath.row].title
                let imgs    = placesModel[indexPath.row].image
                cell.title.text = titles
                cell.image.image = imgs
                cell.image.contentMode = .scaleAspectFill
                cell.imageContainerView.isHidden = false
                
                return cell
            }
            
        case fourthCollectionView:
            let cell    = fourthCollectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.id, for: indexPath) as! FourthCollectionViewCell
            let imgs    = advantagesModel[indexPath.row].icon
            let titles  = advantagesModel[indexPath.row].title
            let descs   = advantagesModel[indexPath.row].description
            
            cell.setupCell(title: titles, desc: descs, image: imgs)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case thirdCollectionView:
            return CGSize(width: 170 , height: 190)
        case fourthCollectionView:
            
            return CGSize(width: 160, height: 180)
        default:
            return CGSize(width: 100, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case thirdCollectionView:
            if indexPath.row == placesModel.count {
                print("Do someting with 'more button' and show the all cities view ")
            }else{
                //                let index = IndexPath(row: indexPath.row, section: 0)
                //                thirdCollectionView.cellForItem(at: index)?.zoomInAndOut()
                
                print("do something with selected index: \(indexPath.row)")
            }
        case fourthCollectionView:
            print("indexPath \(indexPath.row)")
        default:
            print("indexPath \(indexPath.row)")
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
        firstPagerView.automaticSlidingInterval = 5.0
    }
    
    func setupSecondFSPagerView() {
        secondPagerView.register(SecondFSPagerViewCell.nib(), forCellWithReuseIdentifier: SecondFSPagerViewCell.id)
        secondPagerView.dataSource = self
        secondPagerView.delegate   = self
        secondPagerView.interitemSpacing = 20
        secondPagerView.itemSize = CGSize(width: 150, height: 150)
    }
    
    func addDataToFirstFSPagerView() {
        self.firstArr.append(UIImage(named: "Pyramids")!)
        self.firstArr.append(UIImage(named: "DownTown")!)
        self.firstArr.append(UIImage(named: "Sharm El-Sheikh")!)
    }
    
    func addDataToSecondFSPagerView() {
        self.urbansModel.append(PlacesModel(image: UIImage(named: "House")!, title: NSLocalizedString("House", comment: "")))
        self.urbansModel.append(PlacesModel(image: UIImage(named: "Villa")!, title: NSLocalizedString("Villa", comment: "")))
        self.urbansModel.append(PlacesModel(image: UIImage(named: "Chaleet")!, title: NSLocalizedString("Chaleet", comment: "")))
        self.urbansModel.append(PlacesModel(image: UIImage(named: "Villages")!, title: NSLocalizedString("Village", comment: "")))
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        switch pagerView {
        case firstPagerView:
            return firstArr.count
        case secondPagerView:
            return urbansModel.count
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
            let images = urbansModel[index].image
            let titles = urbansModel[index].title
            cell.setupCell(image: images, title: titles)
            return cell
            
        default:
            return FSPagerViewCell()
        }
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        switch pagerView {
        case firstPagerView:
            self.firstPagerView.scrollToItem(at: index, animated: true)
            print(index)
            self.firstPagerView.deselectItem(at: index, animated: true)
        case secondPagerView:
            self.secondPagerView.scrollToItem(at: index, animated: true)
            self.secondPagerView.deselectItem(at: index, animated: true)
        default:
            print("Nothing")
        }
    }
}
