//
//  SecondCollectionViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/22/23.
//

import UIKit
import FSPagerView

@available (iOS 13, *)

class SecondFSPagerViewCell: FSPagerViewCell {
    //MARK:- Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    //MARK:- Properties

    static let id = "SecondFSPagerViewCell"
    //MARK:- Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK:- Methods
    static func nib() -> UINib {
        return UINib(nibName: "SecondFSPagerViewCell", bundle: nil)
    }

    func setupCell(image: UIImage, title: String) {
        self.image.image = image
        self.title.text = title
    }
    
}
