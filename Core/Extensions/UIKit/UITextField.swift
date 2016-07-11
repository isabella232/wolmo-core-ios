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
     This is intended to be used in a form, so in the delegate it can directly change to nextTextField
     (which was assigned previously).
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
