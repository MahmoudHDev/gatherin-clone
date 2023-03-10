//
//  TopBar.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 3/10/23.
//
import Foundation
import UIKit.UIView

class TopBar: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor(named: "purpleButton")
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer

    }
}
