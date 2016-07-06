//
//  UITextFieldExtension.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

private var nextTextFieldKey: UInt8 = 0

public extension UITextField {
    
    // This is intended to be used when we have a form, so in the delegate we can directly change to the next texfield
    // (which is assigned previously in nextTextField)
    public var nextTextField: UITextField? {
        get {
            return getAssociatedObject(self, key: &nextTextFieldKey)
        }
        
        set {
            setAssociatedObject(self, value: newValue, key: &nextTextFieldKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
