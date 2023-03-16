//
//  MoreTableViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/16/23.
//

import UIKit

class SecondMoreTableViewCell: UITableViewCell {
    // MARK:- Propeties
    static let id = "SecondMoreTableViewCell"
    
    // MARK:- Outlets
    @IBOutlet weak var img          : UIImageView!
    @IBOutlet weak var title        : UILabel!
    @IBOutlet weak var chevronImg   : UIImageView!
    
    // MARK:- Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK:- Methods
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondMoreTableViewCell", bundle: nil)
    }
    
    func setupCell(img: UIImage, title: String, chevronImg: UIImage) {
        self.img.image          = img
        self.title.text         = title
        self.chevronImg.image   = chevronImg
        
    }
    
}
