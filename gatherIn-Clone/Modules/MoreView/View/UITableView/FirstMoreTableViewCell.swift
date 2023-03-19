//
//  SecondMoreTableViewCell.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/16/23.
//

import UIKit

class FirstMoreTableViewCell: UITableViewCell {
    // MARK:- Properties
    static let id = "FirstMoreTableViewCell"
    // MARK:- Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    // MARK:- Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK:- Methods
    static func nib() -> UINib {
        return UINib(nibName: "FirstMoreTableViewCell", bundle: nil)
    }
    
    func setupCell(title: String, subTitle: String) {
        self.title.text = title
        self.subTitle.text = subTitle
    }
}
