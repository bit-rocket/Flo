//
//  PushButton.swift
//  Flo
//
//  Created by itrump on 2018/10/12.
//  Copyright © 2018 fengxiaoyang. All rights reserved.
//

import UIKit

@IBDesignable class PushButton: UIButton {
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // the circle
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()

        // the "-"
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift
        ))
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift
        ))
        UIColor.white.setStroke()
        plusPath.stroke()
        
        // the "-"
        if isAddButton {
            let vertHeight: CGFloat = plusWidth
            let halfVertHeight = vertHeight / 2
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight + halfVertHeight + Constants.halfPointShift
            ))
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight - halfVertHeight + Constants.halfPointShift
            ))
        }

        UIColor.white.setStroke()
        plusPath.stroke()
    }


}
