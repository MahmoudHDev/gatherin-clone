//
//  MainPresenter.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/23/23.
//

import Foundation

protocol MainPresenterPr {
    
}

class MainPresenter {
    // MARK:- Properties
    var view: MainPresenterPr?
    
    // MARK:- Init
    init(view: MainPresenterPr) {
        self.view = view
        print("Presenter Has been init")
    }
    
    
}
