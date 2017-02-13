//
//  SignalProducerSpec.swift
//  Core
//
//  Created by Francisco Depascuali on 7/15/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Quick
import Nimble
import Result
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
                
                it("should ignore the error and complete") { waitUntil { done in
                    let converted: SignalProducer<(), NoError> = producer.liftError()
                    
                    converted.collect().startWithValues {
                        expect($0).to(beEmpty())
                    }
                    property.value = ""
                }}
                
                it("should not ignore a value") { waitUntil { done in
                    
                    let converted: SignalProducer<(), NoError> = producer.liftError()
                    
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(2))
                        done()
                    }
                    property.value = "value"
                    property.value = ""
                }}
                
            }
            
        }
        
        describe("#toResultSignalProducer") {

            context("When sending a value") {
                
                it("should send on the value wrapped") { waitUntil { done in
                    let producer = SignalProducer<(), NSError> { observer, _ in
                        observer.send(value: ())
                        observer.sendCompleted()
                    }
                    let converted = producer.toResultSignalProducer()
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                }}
                
            }
            
            context("When sending an error") {
                
                it("should send on the error as a wrapped value") { waitUntil { done in
                    let producer = SignalProducer<(), NSError> { observer, _ in
                        observer.send(error: NSError(domain: "", code: 0, userInfo: [:]))
                    }
                    let converted = producer.toResultSignalProducer()
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                }}
                
            }
            
            context("When sending values and errors") {
                
                it("should send on everything wrapped up until it completes") { waitUntil { done in
                    let producer = SignalProducer<(), NSError> { observer, _ in
                        observer.send(value: ())
                        observer.send(error: NSError(domain: "", code: 0, userInfo: [:]))
                        observer.send(value: ())
                    }
                    let converted = producer.toResultSignalProducer()
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(2))
                        done()
                    }
                }}
                
            }
            
        }
        
        describe("#filterValues") {
            
            context("When sending a success value") {
                
                it("should send on the value") { waitUntil { done in
                    let producer = SignalProducer<Result<(), NSError>, NoError> { observer, _ in
                        observer.send(value: .success())
                        observer.sendCompleted()
                    }
                    let converted = producer.toResultSignalProducer()
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                }}
                
            }
            
            context("When sending a failure value") {
                
                it("shouldn't send on the error") { waitUntil { done in
                    let producer = SignalProducer<Result<(), NSError>, NoError> { observer, _ in
                        observer.send(value: .failure(NSError(domain: "", code: 0, userInfo: [:])))
                        observer.sendCompleted()
                    }
                    let converted = producer.toResultSignalProducer()
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(0))
                        done()
                    }
                }}
                
            }
            
        }
        
        describe("#filterErrors") {
            
            context("When sending a success value") {
                
                it("shouldn't send on the value") { waitUntil { done in
                    let producer = SignalProducer<Result<(), NSError>, NoError> { observer, _ in
                        observer.send(value: .success())
                        observer.sendCompleted()
                    }
                    let converted = producer.toResultSignalProducer()
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(0))
                        done()
                    }
                }}
                
            }
            
            context("When sending a failure value") {
                
                it("should send on the error") { waitUntil { done in
                    let producer = SignalProducer<Result<(), NSError>, NoError> { observer, _ in
                        observer.send(value: .failure(NSError(domain: "", code: 0, userInfo: [:])))
                        observer.sendCompleted()
                    }
                    let converted = producer.toResultSignalProducer()
                    converted.collect().startWithValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                }}
                
            }
            
        }
        
    }
    
}
