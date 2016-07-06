//
//  String.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public func / (lhs: String, rhs: String) -> String {
    return (lhs as NSString).stringByAppendingPathComponent(rhs)
}

public extension String {
    
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    public func localized(arguments: CVarArgType...) -> String {
        return String(format: NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: ""), arguments: arguments)
    }
    
    public var length: Int {
        return characters.count
    }
    
    public var url: NSURL? {
        return NSURL(string: self)
    }
    
    public var hasSpaces: Bool {
        let whitespace = NSCharacterSet.whitespaceCharacterSet()
        let range = rangeOfCharacterFromSet(whitespace)
        return range != nil
    }
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
    /*
     cleanText: This function remove leading and trailing whitespaces.
     
     - returns: The resulting string
     */
    public func cleanText() -> String {
        return stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    public func replace(string: String, replacement: String) -> String {
        return stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    public var withoutWhitespaces: String {
        return replace(" ", replacement: "")
    }
    
}
