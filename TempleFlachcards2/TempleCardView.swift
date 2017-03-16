//
//  TempleCardView.swift
//  TempleFlachcards2
//
//  Created by Nathan Johnson on 11/2/15.
//  Copyright © 2015 Nathan Johnson. All rights reserved.
//

import UIKit

// MARK: global constants

var FONT_NAME: String { return "Helvetica" }
var FONT_SCALE_FACTOR: CGFloat { return 0.07 }

class TempleCardView : UIView {
    var filename: String!
    var name: String!
    var image: UIImage!
    var studyMode = false
    var selected = false
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(rect: self.bounds)
        
//        if selected {
//            UIColor.grayColor().setFill()
//        } else {
//            UIColor.whiteColor().setFill()
//        }
        
        UIColor.whiteColor().setStroke()
        path.lineWidth = 10
        path.fill()
        
        image = UIImage(named: filename)!
        image.drawInRect(bounds)
        
        path.stroke()
        
        if studyMode {
            let font = UIFont(name: FONT_NAME, size: bounds.size.width * FONT_SCALE_FACTOR)!
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .Center
            
            let foregroundColor = UIColor.whiteColor()
            let backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
            
            let label = NSAttributedString(string: name, attributes: [
                NSFontAttributeName : font,
                NSParagraphStyleAttributeName : paragraphStyle,
                NSForegroundColorAttributeName : foregroundColor
                ])
            
            var textBounds = CGRectZero
            
            // set size and location of CGRect that the label will fill
            textBounds.size.height = label.size().height
            textBounds.size.width = bounds.size.width - path.lineWidth
            textBounds.origin = CGPointMake((bounds.size.width - textBounds.size.width) / 2.0,
                (bounds.size.height - textBounds.size.height - path.lineWidth))

            // colors the textBounds to gray that the label will be on top of, stretches across the temple image
            let templeNamePath = UIBezierPath(rect: textBounds)
            backgroundColor.setFill()
            templeNamePath.fill()
            
            label.drawInRect(textBounds)
        }
    }
}
