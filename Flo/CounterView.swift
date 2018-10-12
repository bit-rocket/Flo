//
//  CounterView.swift
//  Flo
//
//  Created by itrump on 2018/10/12.
//  Copyright © 2018 fengxiaoyang. All rights reserved.
//

import UIKit

@IBDesignable class CounterView: UIView {

    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing the arc
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        let path = UIBezierPath(arcCenter: center, radius: radius / 2 - Constants.arcWidth / 2,
                                startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        // draw the outline
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        // ourter arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width / 2 - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        // inner arc
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width / 2 - Constants.arcWidth + Constants.halfOfLineWidth,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        outlinePath.close()
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
    }

}
