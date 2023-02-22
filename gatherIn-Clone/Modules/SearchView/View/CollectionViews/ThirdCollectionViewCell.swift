//
//  ThirdCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {

    static let id = "ThirdCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ThirdCollectionViewCell", bundle: nil)
    }
}
