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
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: self.bounds)
        
//        if selected {
//            UIColor.grayColor().setFill()
//        } else {
//            UIColor.whiteColor().setFill()
//        }
        
        UIColor.white.setStroke()
        path.lineWidth = 10
        path.fill()
        
        image = UIImage(named: filename)!
        image.draw(in: bounds)
        
        path.stroke()
        
        if studyMode {
            let font = UIFont(name: FONT_NAME, size: bounds.size.width * FONT_SCALE_FACTOR)!
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let foregroundColor = UIColor.white
            let backgroundColor = UIColor.gray.withAlphaComponent(0.5)
            
            let label = NSAttributedString(string: name, attributes: [
                NSFontAttributeName : font,
                NSParagraphStyleAttributeName : paragraphStyle,
                NSForegroundColorAttributeName : foregroundColor
                ])
            
            var textBounds = CGRect.zero
            
            // set size and location of CGRect that the label will fill
            textBounds.size.height = label.size().height
            textBounds.size.width = bounds.size.width - path.lineWidth
            textBounds.origin = CGPoint(x: (bounds.size.width - textBounds.size.width) / 2.0,
                y: (bounds.size.height - textBounds.size.height - path.lineWidth))

            // colors the textBounds to gray that the label will be on top of, stretches across the temple image
            let templeNamePath = UIBezierPath(rect: textBounds)
            backgroundColor.setFill()
            templeNamePath.fill()
            
            label.draw(in: textBounds)
        }
    }
}
