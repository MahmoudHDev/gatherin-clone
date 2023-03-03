//
//  FirstFSPagerViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/3/23.
//

import UIKit
import FSPagerView

class FirstFSPagerViewCell: FSPagerViewCell {
    static let id = "FirstFSPagerViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstFSPagerViewCell", bundle: nil)
    }
    
}
