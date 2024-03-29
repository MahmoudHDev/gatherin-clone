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
        let firstLayout = UICollectionViewFlowLayout()
        firstLayout.minimumLineSpacing = 0
        firstLayout.minimumInteritemSpacing = 0
        firstLayout.scrollDirection = .horizontal
        firstCollectionView.collectionViewLayout = firstLayout
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        
        let secondLayout = UICollectionViewFlowLayout()
        secondLayout.minimumLineSpacing = 10
        secondLayout.minimumInteritemSpacing = 10
        secondLayout.scrollDirection = .horizontal
        
        firstCollectionView.register(FirstCollectionViewCell.nib(), forCellWithReuseIdentifier: FirstCollectionViewCell.id)
        firstCollectionView.dataSource  = self
        firstCollectionView.delegate    = self
        firstCollectionView.showsHorizontalScrollIndicator = false
        
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
    
    func addDataToFirstCollectionView() {
        self.firstArr.append(UIImage(named: "Pyramids")!)
        self.firstArr.append(UIImage(named: "DownTown")!)
        self.firstArr.append(UIImage(named: "Sharm El-Sheikh")!)
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
        case firstCollectionView:
            return firstArr.count
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
        
        case firstCollectionView:
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.id, for: indexPath) as! FirstCollectionViewCell
            
            let images = firstArr[indexPath.row]
            cell.img.image = images
            
            return cell
            
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
        case firstCollectionView:
            return CGSize(width: firstCollectionView.frame.width, height: firstCollectionView.frame.height)
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
        case firstCollectionView:
            print(indexPath.row)
            
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
