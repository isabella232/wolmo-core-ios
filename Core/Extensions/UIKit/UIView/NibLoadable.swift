//
//  NibLoadable.swift
//  Core
//
//  Created by Francisco Depascuali on 7/6/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/*
 Represents an object which is loaded from a nib.
 */
public protocol NibLoadable: class {
    
    // Using generics because using Self makes it impossible to
    //   provide default implementations for non-final classes.
    static func loadFromNib<T>(inBundle bundle: Bundle) -> T?
    
}

public extension NibLoadable where Self: UIView {
    
    /**
        Loads the nib for the specific view, it will use the view name as the xib name.
 
        - parameter bundle: Specific bundle, default = bundle for the class.
        - returns: The loaded UIView
    */
    public static func loadFromNib<T>(inBundle bundle: Bundle = Bundle(for: Self.self)) -> T? {
        let nibName = NSStringFromClass(self).components(separatedBy: ".").last
        return nibName.flatMap(bundle.loadNib)
    }
    
}
