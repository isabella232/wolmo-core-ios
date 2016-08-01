//
//  UIButton.swift
//  Core
//
//  Created by Daniela Riesgo on 7/25/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /*
     Sets the button's title underlined with style and for state specified.
     
     - parameter title: Title for the button.
     - parameter style: NSUnderlineStyle with which the title is underlined.
        By default, StyleSingle.
     - parameter color: UIColor for the underline, or None if the color
        should be the same as the foreground's. By default, None.
     - parameter forState: UIControlState for which to set the title.
        By default, Normal.
     
     */
    public func setUnderlinedTitle(title: String, style: NSUnderlineStyle = .StyleSingle, color: UIColor? = .None, forState state: UIControlState = .Normal) {
        var attributes: [String : AnyObject] = [NSUnderlineStyleAttributeName: style.rawValue]
        if let colorAttr = color {
            attributes[NSUnderlineColorAttributeName] = colorAttr
        }
        let underlinedText = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(underlinedText, forState: state)
        
    }
    
}
