//
//  SecondCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit
import FSPagerView

@available (iOS 13, *)

class SecondCollectiionViewCell: UICollectionViewCell {
    //MARK:- Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    //MARK:- Properties

    static let id = "SecondCollectiionViewCell"
    //MARK:- Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 22
    }
    
    //MARK:- Methods
    static func nib() -> UINib {
        return UINib(nibName: "SecondCollectiionViewCell", bundle: nil)
    }

    func setupCell(image: UIImage, title: String) {
        self.image.image = image
        self.title.text = title
    }
    
}
