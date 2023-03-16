//
//  UIView+Extensions.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/15/23.
//

import UIKit

extension UIView {
    func zoomInAndOut(duration: TimeInterval = 0.2, scale: CGFloat = 1.2) {
        UIView.animate(withDuration: duration,
            animations: {
                // set the button's size to be larger and smaller
                self.transform = CGAffineTransform(scaleX: scale, y: scale)
            },
            completion: { _ in
                // reset the button's size to its original state
                UIView.animate(withDuration: duration) {
                    self.transform = CGAffineTransform.identity
                }
            }
        )
    }
}
