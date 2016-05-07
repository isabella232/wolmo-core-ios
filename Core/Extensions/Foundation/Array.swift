//
//  Array.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

extension Array {
    
    /**
     Groups elements by the criteria provided.
     
     - parameter buildGroupKey: returns the appropiate key for each element.
     
     - returns: Dictionary with elements grouped by their corresponding keys.
     */
    func groupBy<K>(buildGroupKey: Element -> K) -> [K: [Element]] {
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
    
    func concat(element: Element) -> Array<Element> {
        var result = self
        result.append(element)
        return result
    }
    
    func get(index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
    
    func filterFirst(condition: Element -> Bool) -> Element? {
        return indexOf(condition).map { self[$0] }
    }
    
}
