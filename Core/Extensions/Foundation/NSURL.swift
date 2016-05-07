//
//  NSURL.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public func/(baseURL: NSURL, pathComponent: String) -> NSURL {
    return baseURL.URLByAppendingPathComponent(pathComponent)
}

public func/(lhs: NSURL, rhs: Int) -> NSURL {
    return lhs / String(rhs)
}

public extension NSURL {
    
    public var isHTTPProtocol: Bool {
        return self.absoluteString.lowercaseString.rangeOfString("http") != nil
    }
    
    public func containsSubDirectory(directoryName: String) -> Bool {
        return pathComponents?.contains(directoryName) ?? false
    }
    
}
