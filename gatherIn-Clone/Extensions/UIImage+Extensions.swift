//
//  UIImage+Extensions.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/17/23.
//

import UIKit.UIImage
extension UIImage {
    func resize(to newSize: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
//
