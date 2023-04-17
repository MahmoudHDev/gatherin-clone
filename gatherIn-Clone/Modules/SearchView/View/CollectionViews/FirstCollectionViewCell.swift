//
//  FirstCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 4/16/23.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    
    
    static let id = "FirstCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
    }
    

}
