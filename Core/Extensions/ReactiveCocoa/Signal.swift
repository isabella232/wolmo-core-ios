//
//  Signal.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import ReactiveCocoa

public extension Signal {
    
    /**
     Transforms a `Signal<Value, Error>` to `Signal<Value, NewError>`
     This is usually useful when the `flatMap` operator is used and the outer
     signal has `NoError` error type and the inner one a different type of error.
     
     - returns: A signal with the same value type but with `NewError` as the error type
     */
    func liftError<NewError: Error>() -> Signal<Value, NewError> {
        return flatMapError { _ in SignalProducer<Value, NewError>.empty }
    }
    
}
