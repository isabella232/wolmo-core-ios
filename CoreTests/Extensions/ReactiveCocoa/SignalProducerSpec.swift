//
//  SignalProducerSpec.swift
//  Core
//
//  Created by Francisco Depascuali on 7/15/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Quick
import Nimble
import enum Result.NoError
import ReactiveCocoa
import Core

public class SignalProducerSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#liftError") {
            
            context("When lifting an error") {
                
                var producer: SignalProducer<(), NSError>!
                
                var observer: Observer<(), NSError>!
                
                beforeEach {
                    let (_producer, _observer) = SignalProducer<(), NSError>.buffer(0)
                    producer = _producer
                    observer = _observer
                }
                
                it("should ignore the error and complete") {
                    
                    let converted: SignalProducer<(), NoError> = producer.liftError()
                    
                    converted.collect().startWithNext {
                        expect($0).to(beEmpty())
                    }
                    
                    observer.sendFailed(NSError(domain: "", code: 0, userInfo: [:]))
                }
            }
            
        }
    }
}
