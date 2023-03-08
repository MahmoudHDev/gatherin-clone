//
//  ThirdCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit

@available (iOS 13, *)

class ThirdCollectionViewCell: UICollectionViewCell {
    //MARK:- Outlets
    @IBOutlet weak var image                : UIImageView!
    @IBOutlet weak var title                : UILabel!

    //MARK:- Properties

    static let id = "ThirdCollectionViewCell"
    

    //MARK:- Nib

    override func awakeFromNib() {
        super.awakeFromNib()
        
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 22
        
    }
    //MARK:- Methods

    static func nib() -> UINib {
        return UINib(nibName: "ThirdCollectionViewCell", bundle: nil)
    }
    

    func setupCell(image: UIImage, title: String) {
        self.image.image = image
        self.title.text = title
    }

    
}

