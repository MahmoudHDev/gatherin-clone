//
//  FourthCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit

@available (iOS 13, *)

class FourthCollectionViewCell: UICollectionViewCell {
    
    static let id = "FourthCollectionViewCell"
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc : UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(title: String, desc: String, image: UIImage) {
        self.title.text = title
        self.desc.text = desc
        self.image.image = image
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "FourthCollectionViewCell", bundle: nil)
    }

}
