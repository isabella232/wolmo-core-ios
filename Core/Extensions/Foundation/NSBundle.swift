//
//  NSBundle.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension NSBundle {

    public func loadNib<T>(name: String) -> T {
        // swiftlint:disable force_cast
        return loadNibNamed(name, owner: self, options: nil)[0] as! T
        // swiftlint:enable force_cast
    }
    
    public func get(key: String) -> String {
        guard let value = objectForInfoDictionaryKey(key) as? String where !value.isEmpty else {
            fatalError("Key: \"\(key)\" has not been configured in Info.plist")
        }
        return value
    }
    
}
