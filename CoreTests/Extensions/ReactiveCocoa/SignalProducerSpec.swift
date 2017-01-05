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
import ReactiveSwift
import Core

public class SignalProducerSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#liftError") {
            
            context("When lifting an error") {
                
                var producer: SignalProducer<(), NSError>!

                var property: MutableProperty<String> = MutableProperty("")
                
                beforeEach {
                    property = MutableProperty("")
                    producer = property.producer.skip(first: 1).flatMap(.concat) { value -> SignalProducer<(), NSError> in
                        if (value.isEmpty) {
                            return SignalProducer(error: NSError(domain: "", code: 0, userInfo: [:]))
                        } else {
                            return SignalProducer(value: ())
                        }
                    }
                }
                
                it("should ignore the error and complete") {
                    
                    let converted: SignalProducer<(), NoError> = producer.liftError()
                    
                    converted.collect().startWithValues {
                        expect($0).to(beEmpty())
                    }
                    property.value = ""
                }
                
                it("should not ignore a value") { waitUntil { done in
                    
                    let converted: SignalProducer<(), NoError> = producer.liftError()
                    
                    converted.startWithValues {
                        done()
                    }
                    property.value = "value"
                    property.value = ""
                }}
            }
            
        }
    }
}
