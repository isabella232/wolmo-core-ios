//
//  NSURL.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/**
 Appends a string to an URL.
 
 - parameter baseURL: base URL.
 - parameter pathComponent: path that will be appended.
 
 - returns: The new NSURL, with pathComponent appended to baseURL
 */
public func / (baseURL: URL, pathComponent: String) -> URL {
    return baseURL.appendingPathComponent(pathComponent)
}

/**
 Appends an int to an URL.
 
 - parameter baseURL: base URL.
 - parameter pathComponent: Int number that will be appended.
 
 - returns: The new NSURL, with pathComponent appended to baseURL
 */
public func / (baseURL: URL, pathComponent: Int) -> URL {
    return baseURL / String(pathComponent)
}

public extension URL {
    
    /**
     Returns if the URL is of type HTTP protocol.
    */
    public var isHTTPProtocol: Bool {
        return absoluteString.lowercased()
                .substring(to: absoluteString.characters.index(absoluteString.startIndex, offsetBy: 5)) // We want HTTP (4) or HTTPS(5)
                .range(of: "http") != nil
    }
    
    /**
     Returns if the URL contains the specified subDirectory.
     
     - parameter subDirectory: The subDirectory to look for.
    */
    public func contains(subDirectory: String) -> Bool {
        return pathComponents.contains(subDirectory) ?? false
    }
    
}
