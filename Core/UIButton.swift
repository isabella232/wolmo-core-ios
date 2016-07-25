//
//  UIButton.swift
//  Core
//
//  Created by Daniela Riesgo on 7/25/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func setUnderlinedTitle(title: String, style: NSUnderlineStyle = .StyleSingle, color: UIColor? = .None, forState state: UIControlState = .Normal) {
        var attributes: [String : AnyObject] = [NSUnderlineStyleAttributeName: style.rawValue]
        if let colorAttr = color {
            attributes[NSUnderlineColorAttributeName] = colorAttr
        }
        let underlinedText = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(underlinedText, forState: state)
        
    }
    
}
