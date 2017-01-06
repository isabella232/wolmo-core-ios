//
//  Signal.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import ReactiveSwift

public extension SignalProtocol {
    
    /**
     Transforms a `Signal<Value, Error>` to `Signal<Value, NewError>`
     This is usually useful when the `flatMap` operator is used and the outer
     signal has `NoError` error type and the inner one a different type of error.
     
     - returns: A signal with the same value type but with `NewError` as the error type
     */
    func liftError<NewError>() -> Signal<Value, NewError> {
        return flatMapError { _ in SignalProducer<Value, NewError>.empty }
    }
    
}
