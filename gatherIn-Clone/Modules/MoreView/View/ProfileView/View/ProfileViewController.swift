//
//  ProfileViewController.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/19/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Profile", comment: "")
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        print("View Dismissed")
    }
    

}
