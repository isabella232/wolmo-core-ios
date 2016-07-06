//
//  NibLoadable.swift
//  Core
//
//  Created by Francisco Depascuali on 7/6/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public protocol NibLoadable {
    
    static func loadFromNib<T: UIView>(bundle: NSBundle) -> T
    
}

extension UIView: NibLoadable {
    
    /// Loads the nib for the specific view , it will use the view name as the xib name.
    ///
    /// - parameter bundle: Specific bundle, default = mainBundle.
    /// - returns: The loaded UIView
    public static func loadFromNib<T: UIView>(bundle: NSBundle = NSBundle.mainBundle()) -> T {
        let nibName = NSStringFromClass(self).componentsSeparatedByString(".").last!
        return bundle.loadNibNamed(nibName, owner: self, options: nil).first as! T // swiftlint:disable:this force_cast
    }
}
