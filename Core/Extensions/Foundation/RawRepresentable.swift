//
//  RawRepresentable.swift
//  Core
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

public extension RawRepresentable where RawValue == Int {
    
    public static func allValues(startingAtRawValue rawValue: Int = 0) -> AnySequence<Self> {
        let generator: RawRepresentableGenerator<Int, Self> = RawRepresentableGenerator(baseRawValue: rawValue) { $0.successor() }
        return AnySequence { generator }
    }
    
    public static func count(startingAtRawValue rawValue: Int = 0) -> Int {
        var c = 0
        for _ in allValues(startingAtRawValue: rawValue) {
            c += 1
        }
        return c
    }
}

public struct RawRepresentableGenerator<RawValue, Representable: RawRepresentable where Representable.RawValue == RawValue>: GeneratorType {
    
    private let _rawValueSuccesor: RawValue -> RawValue?
    private var _nextRawValue: RawValue?
    
    public init(baseRawValue: RawValue, rawValueSuccesor: RawValue -> RawValue?) {
        _nextRawValue = baseRawValue
        _rawValueSuccesor = rawValueSuccesor
    }
    
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
