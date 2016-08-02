//
//  RawRepresentable.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension RawRepresentable where RawValue == Int {
    
    /**
     Returns a sequence that contains all the possible rawValues of self.
     
     - parameter startingAt: The rawValue from which to start.
     */
    public static func allValues(startingAt rawValue: Int = 0) -> AnySequence<Self> {
        let generator: RawRepresentableGenerator<Int, Self> = RawRepresentableGenerator(startingAt: rawValue) { $0.successor() }
        return AnySequence { generator }
    }
    
    /**
     Returns the count of all the possible values of self.
     
     - parameter startingAt: The rawValue from which to start.
     
     - Complexity: O(N) where N = #values - startingAt
     */
    public static func count(startingAt rawValue: Int = 0) -> Int {
        var count = 0
        for _ in allValues(startingAt: rawValue) {
            count += 1
        }
        return count
    }
}

/**
 Creates a generator for the specified RawValue type.
 */
public struct RawRepresentableGenerator<RawValue, Representable: RawRepresentable where Representable.RawValue == RawValue>: GeneratorType {
    
    private let _rawValueSuccesor: RawValue -> RawValue?
    private var _nextRawValue: RawValue?
    
    /**
     Provides a baseRawValue and a function to get a new RawValue.
     */
    public init(startingAt baseRawValue: RawValue, rawValueSuccesor: RawValue -> RawValue?) {
        _nextRawValue = baseRawValue
        _rawValueSuccesor = rawValueSuccesor
    }
    
    /**
     Provides a baseRawValue and a function to get a new RawValue.
     */
    public init(startingAt baseRawValue: Representable, rawValueSuccesor: RawValue -> RawValue?) {
        _nextRawValue = baseRawValue.rawValue
        _rawValueSuccesor = rawValueSuccesor
    }
    
    /**
     Returns the new representable value.
     
     - note: The first value, is always the element associated with the baseRawValue
     provided at init.
     */
    public mutating func next() -> Representable? {
        if let nextRawValue = _nextRawValue {
            let value = Representable(rawValue: nextRawValue)
            _nextRawValue = _rawValueSuccesor(nextRawValue)
            return value
        } else {
            return .None
        }
    }
    
}
