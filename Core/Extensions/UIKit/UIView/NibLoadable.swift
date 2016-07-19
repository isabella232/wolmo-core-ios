//
//  NibLoadable.swift
//  Core
//
//  Created by Francisco Depascuali on 7/6/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public protocol NibLoadable {
    
    static func loadFromNib<T: UIView>(bundle: NSBundle) -> T?
    
}

extension NibLoadable where Self: UIView {
    
    /**
        Loads the nib for the specific view , it will use the view name as the xib name.
 
        - parameter bundle: Specific bundle, default = mainBundle.
        - returns: The loaded UIView
    */
    public static func loadFromNib<T: UIView>(bundle: NSBundle = NSBundle.mainBundle()) -> T? {
        let nibName = NSStringFromClass(self).componentsSeparatedByString(".").last
        return nibName.flatMap(bundle.loadNib)
    }
}
