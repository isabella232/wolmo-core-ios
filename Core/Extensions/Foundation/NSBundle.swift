//
//  NSBundle.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension NSBundle {
    
    public func loadNib<NibType, T: RawRepresentable where T.RawValue == String>(nibName: T) -> NibType {
        return loadNib(nibName.rawValue)
    }
    
    public func loadNib<NibType>(nibName: String) -> NibType {
        // swiftlint:disable force_cast
        return loadNibNamed(nibName, owner: self, options: nil)[0] as! NibType
        // swiftlint:enable force_cast
    }
    
    public subscript(key: String) -> String {
        guard let value = objectForInfoDictionaryKey(key) as? String where !value.isEmpty else {
            fatalError("Key: \"\(key)\" has not been configured in Info.plist")
        }
        return value
    }
    
}
