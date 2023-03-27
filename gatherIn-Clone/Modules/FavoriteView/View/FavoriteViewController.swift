//
//  FavoriteViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/19/23.
//

import UIKit

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationControllerStyle()
    }
    private func navigationControllerStyle() {
        title = NSLocalizedString("Favorites", comment: "")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "purpleButton")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }


}
