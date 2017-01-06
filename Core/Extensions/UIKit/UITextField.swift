//
//  UITextFieldExtension.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension UITextField {
    
    /**
     nextTextField is intended to be used in a form, so that the delegate uses it, for example, in the textFieldShouldReturn method.
     
     - warning: Avoid setting nextTextField in the didSet hook of an outlet.
     Override awakeFromNib() of the containing view in that case.
     */
    public var nextTextField: UITextField? {
        get {
            return getAssociatedObject(self, key: &nextTextFieldKey)
        }
        
        set {
            setAssociatedObject(self, key: &nextTextFieldKey, value: newValue, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

private var nextTextFieldKey: UInt8 = 0
