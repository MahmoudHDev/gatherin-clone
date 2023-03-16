//
//  CitiesTableViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/16/23.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    // MARK:- Properties
    static let id = "CitiesTableViewCell"
    // MARK:- Outlets
    @IBOutlet weak var cityName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Methods
    static func nib() -> UINib {
        return UINib(nibName: "CitiesTableViewCell", bundle: nil)
    }
}
