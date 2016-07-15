//
//  NSBundle.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension NSBundle {
    
    /**
     Loads a nib from the bundle.
     
     - parameter nibName: Contains a StringRepresentable nib.
     - returns: The loaded NibType or .None if it don't exists.
     - seealso: loadNib(nibName: String)
     */
    public func loadNib<NibType, T: RawRepresentable where T.RawValue == String>(nibName: T) -> NibType? {
        return loadNib(nibName.rawValue)
    }
    
    /**
     Returns the value associated with the specified key in the receiver's information property list.
     
     The value associated with key in the receiver's property list (Info.plist). The localized value of a key is returned when one is available.
     
     - parameter key: A key in the receiver's property list.
     - returns: The value associated with key in the receiver's property list (Info.plist) or .None if it don't exists.
     - seealso: objectForInfoDictionaryKey()
    */
    public subscript(key: String) -> String? {
        guard let value = objectForInfoDictionaryKey(key) as? String where !value.isEmpty else {
            return .None
        }
        return value
    }
    
}

private extension NSBundle {
    
    /**
     Loads a nib from the bundle.
     
     - parameter nibName: the name of the nib.
     - returns: The loaded NibType or .None if it don't exists.
     - note: This is private to force the user to avoid using fixed strings.
     */
    private func loadNib<NibType>(nibName: String) -> NibType? {
        return loadNibNamed(nibName, owner: self, options: nil)[0] as? NibType
    }
}
