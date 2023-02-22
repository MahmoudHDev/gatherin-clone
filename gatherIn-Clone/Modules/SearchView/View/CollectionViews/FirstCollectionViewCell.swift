//
//  FirstCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit

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
