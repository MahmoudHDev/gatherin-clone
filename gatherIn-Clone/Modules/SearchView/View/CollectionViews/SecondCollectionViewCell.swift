//
//  SecondCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit

@available (iOS 13, *)

class SecondCollectionViewCell: UICollectionViewCell {

    static let id = "SecondCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondCollectionViewCell", bundle: nil)
    }
}
