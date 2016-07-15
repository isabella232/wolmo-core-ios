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
        let generator: RawRepresentableGenerator<Int, Self> = RawRepresentableGenerator(baseRawValue: rawValue) { $0.successor() }
        return AnySequence { generator }
    }
    
    /**
     Returns the count of all the possible values of self.
     
     - parameter startingAt: The rawValue from which to start.
     */
    public static func count(startingAt rawValue: Int = 0) -> Int {
        var c = 0
        for _ in allValues(startingAt: rawValue) {
            c += 1
        }
        return c
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
    public init(baseRawValue: RawValue, rawValueSuccesor: RawValue -> RawValue?) {
        _nextRawValue = baseRawValue
        _rawValueSuccesor = rawValueSuccesor
    }
    
    /**
     Returns the new representable value.
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
