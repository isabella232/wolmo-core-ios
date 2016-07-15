//
//  Array.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension Array {
    
    /**
     Groups elements by the criteria provided.
     
     - parameter buildGroupKey: returns the appropiate key for each element.
     
     - returns: Dictionary with elements grouped by their corresponding keys.
     */
    public func groupBy<K>(buildGroupKey: Element -> K) -> [K: [Element]] {
        var result: [K : [Element]] = [:]
        for element in self {
            let key = buildGroupKey(element)
            if var groupedElements = result[key] {
                groupedElements.append(element)
                result[key] = groupedElements
            } else {
                result[key] = [element]
            }
        }
        return result
    }
    
    /**
     Returns a new array with element appended to the Array.
     
     - Complexity: Amortized O(1) unless self's storage is shared with another live array; 
     O(count) if self does not wrap a bridged NSArray; otherwise the efficiency is unspecified.
     - seealso: append().
    */
    public func appending(element: Element) -> [Element] {
        var result = self
        result.append(element)
        return result
    }
    
    /**
     Returns the indexth element. 
     - Complexity:
     Reading is O(1). 
     Writing is O(1) unless self's storage is shared with another live array; O(count) if self does not wrap a bridged NSArray; otherwise the efficiency is unspecified..
     
     - Note: This function should be used over subscript when we don't want a runtime error when indexth element doesn't exist.
     - Warning: Returns .None if the index is out of bound.
     - seealso: subcript()
     */
    public func get(index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
    
    /**
     Returns the first index where predicate returns true for the corresponding value, or nil if such value is not found.
     
     - parameter condition: The condition that will be applied.
     - returns: The element that satisfies the predicate or .None if none satisfies.
     - seealso: indexOf()
    */
    public func filterFirst(condition: Element -> Bool) -> Element? {
        return indexOf(condition).map { self[$0] }
    }
    
}
