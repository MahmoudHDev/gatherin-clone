//
//  VacationRentalTableViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/18/23.
//

import UIKit

class ChooseCityTableViewCell: UITableViewCell {
    
    static let id = "ChooseCityTableViewCell"
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ChooseCityTableViewCell", bundle: nil)
    }

}
