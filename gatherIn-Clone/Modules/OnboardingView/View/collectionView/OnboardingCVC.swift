//
//  OnboardingCVC.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/20/23.
//

import UIKit

class OnboardingCVC: UICollectionViewCell {
    // MARK:- Outlets
    @IBOutlet weak var img: UIImageView!
    
    // MARK:- Properties
    static let id = "OnboardingCVC"
    
    // MARK:- Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        print("nib has been awaken")
    }
    
    // MARK:- Methods
    static func nib() -> UINib {
        return UINib(nibName: "OnboardingCVC", bundle: nil)
    }
    
    func setupCell(img: UIImage) {
        self.img.image = img
    }
    
}
