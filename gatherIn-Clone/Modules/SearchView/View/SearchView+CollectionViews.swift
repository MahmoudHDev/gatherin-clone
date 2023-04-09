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
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        
        let secondLayout = UICollectionViewFlowLayout()
        secondLayout.minimumLineSpacing = 10
        secondLayout.minimumInteritemSpacing = 10
        secondLayout.scrollDirection = .horizontal

        
        
        secondCollectionView.register(SecondCollectiionViewCell.nib(), forCellWithReuseIdentifier: SecondCollectiionViewCell.id)
        secondCollectionView.dataSource = self
        secondCollectionView.delegate   = self
        secondCollectionView.collectionViewLayout = secondLayout
        secondCollectionView.showsHorizontalScrollIndicator = false
        
        thirdCollectionView.register(ThirdCollectionViewCell.nib(), forCellWithReuseIdentifier: ThirdCollectionViewCell.id)
        thirdCollectionView.dataSource  = self
        thirdCollectionView.delegate    = self
        thirdCollectionView.showsHorizontalScrollIndicator = false
        thirdCollectionView.collectionViewLayout = layout
        
        fourthCollectionView.register(FourthCollectionViewCell.nib(), forCellWithReuseIdentifier: FourthCollectionViewCell.id)
        fourthCollectionView.dataSource = self
        fourthCollectionView.delegate   = self
        
        
    }
    

    func addDataToSecondCollectionView() {
        self.urbansModel.append(PlacesModel(image: UIImage(named: "House")!, title: NSLocalizedString("House", comment: "")))
        self.urbansModel.append(PlacesModel(image: UIImage(named: "Villa")!, title: NSLocalizedString("Villa", comment: "")))
        self.urbansModel.append(PlacesModel(image: UIImage(named: "Chaleet")!, title: NSLocalizedString("Chaleet", comment: "")))
        self.urbansModel.append(PlacesModel(image: UIImage(named: "Villages")!, title: NSLocalizedString("Village", comment: "")))
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
                                icon: UIImage(named: "Verified")!.resize(to: CGSize(width: 20, height: 20)),
                                description: NSLocalizedString("VerifiedDesc", comment: "")))
        
        advantagesModel.append(AdvantagesModel(
                                title: NSLocalizedString("Credibility", comment: ""), icon: UIImage(named: "Credibility")!.resize(to: CGSize(width: 20, height: 20)),
                                description: NSLocalizedString("CredibilityDesc", comment: "")))
        
        advantagesModel.append(AdvantagesModel(
                                title: NSLocalizedString("InstantBooking", comment: ""),
                                icon: UIImage(named: "InstantBooking")!.resize(to: CGSize(width: 20, height: 20)),
                                description: NSLocalizedString("InstantBookingDesc", comment: "")))
        
        advantagesModel.append(AdvantagesModel(
                                title: NSLocalizedString("Options", comment: ""),
                                icon: UIImage(named: "Options")!.resize(to: CGSize(width: 20, height: 20)),
                                description:NSLocalizedString("OptionsDesc", comment: "")))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case secondCollectionView:
            return urbansModel.count
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
        case secondCollectionView:
            let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectiionViewCell.id, for: indexPath) as! SecondCollectiionViewCell
            let images = urbansModel[indexPath.row].image
            let titles = urbansModel[indexPath.row].title
            cell.setupCell(image: images, title: titles)
            return cell

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
        case secondCollectionView:
            return CGSize(width: 170 , height: 190)
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
        
        case secondCollectionView:
            let ChooseCityVC = UIStoryboard(name: "ChooseCity", bundle: nil).instantiateViewController(identifier: "ChooseCityViewController") as! ChooseCityViewController
            ChooseCityVC.selectedUrban = urbansModel[indexPath.row]
            let navigationContr = UINavigationController(rootViewController: ChooseCityVC)
            navigationContr.navigationBar.prefersLargeTitles = true
            self.present(navigationContr, animated: true, completion: nil)
            
            self.secondCollectionView.deselectItem(at: indexPath, animated: true)
        
        case thirdCollectionView:
            if indexPath.row == placesModel.count {
                print("Do someting with 'more button' and show the all cities view ")
            }else{
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
//        firstPagerView.automaticSlidingInterval = 5.0
    }
    

    
    func addDataToFirstFSPagerView() {
        self.firstArr.append(UIImage(named: "Pyramids")!)
        self.firstArr.append(UIImage(named: "DownTown")!)
        self.firstArr.append(UIImage(named: "Sharm El-Sheikh")!)
    }
    
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        switch pagerView {
        case firstPagerView:
            return firstArr.count
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
        default:
            print("Nothing")
        }
    }
}
