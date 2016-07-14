//
//  NSBundle.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension NSBundle {
    
    public func loadNib<NibType, T: RawRepresentable where T.RawValue == String>(nibName: T) -> NibType? {
        return loadNib(nibName.rawValue)
    }
    
    public subscript(key: String) -> String? {
        guard let value = objectForInfoDictionaryKey(key) as? String where !value.isEmpty else {
            return .None
        }
        return value
    }
    
}

private extension NSBundle {
    
    private func loadNib<NibType>(nibName: String) -> NibType? {
        return loadNibNamed(nibName, owner: self, options: nil)[0] as? NibType
    }
}
