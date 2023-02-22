//
//  FirstCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit

@available (iOS 13, *)

class FirstCollectionViewCell: UICollectionViewCell {

    static let id = "FirstCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
    }
}
