//
//  IndividualsPresenter.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 2/3/23.
//

import Foundation

protocol IndividualsView {
    
}

class IndividualsPresenter {
    
    var view: IndividualsView?
    
    init(view: IndividualsView) {
        self.view = view
    }
    
    
}
