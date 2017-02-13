//
//  SignalSpec.swift
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

public class SignalSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#liftError") {
            
            context("When lifting an error") {

                var signal: Signal<(), NSError>!
                var observer: Observer<(), NSError>!
                var converted: Signal<(), NoError>!
                
                beforeEach {
                    let (_signal, _observer) = Signal<(), NSError>.pipe()
                    signal = _signal
                    observer = _observer
                    converted = signal.liftError()
                }
                
                it("should ignore the error and complete") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0).to(beEmpty())
                        done()
                    }
                    observer.send(error: NSError(domain: "", code: 0, userInfo: [:]))
                }}
                
                it("should not ignore a value") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(2))
                        done()
                    }
                    observer.send(value: ())
                    observer.send(value: ())
                    observer.sendCompleted()
                }}
                
            }
            
        }
        
        describe("#toResultSignal") {
            
            var signal: Signal<(), NSError>!
            var observer: Observer<(), NSError>!
            var converted: Signal<Result<(), NSError>, NoError>!
            
            beforeEach {
                let (_signal, _observer) = Signal<(), NSError>.pipe()
                signal = _signal
                observer = _observer
                converted = signal.toResultSignal()
            }
            
            context("When sending a value") {
                
                it("should send on the value wrapped") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                    observer.send(value: ())
                    observer.sendCompleted()
                }}
                
            }
            
            context("When sending an error") {
                
                it("should send on the error as a wrapped value") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                    observer.send(error: NSError(domain: "", code: 0, userInfo: [:]))
                }}
                
            }
            
            context("When sending values and errors") {
                
                it("should send on everything wrapped up until it completes") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(2))
                        done()
                    }
                    observer.send(value: ())
                    observer.send(error: NSError(domain: "", code: 0, userInfo: [:]))
                    observer.send(value: ())
                }}
                
            }
            
        }
        
        describe("#filterValues") {
            
            var signal: Signal<Result<(), NSError>, NoError>!
            var observer: Observer<Result<(), NSError>, NoError>!
            var converted: Signal<(), NoError>!
            
            beforeEach {
                let (_signal, _observer) = Signal<Result<(), NSError>, NoError>.pipe()
                signal = _signal
                observer = _observer
                converted = signal.filterValues()
            }
            
            context("When sending a success value") {
                
                it("should send on the value") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                    observer.send(value: .success())
                    observer.sendCompleted()
                }}
                
            }
            
            context("When sending a failure value") {
                
                it("shouldn't send on the error") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(0))
                        done()
                    }
                    observer.send(value: .failure(NSError(domain: "", code: 0, userInfo: [:])))
                    observer.sendCompleted()
                }}
            
            }
        
        }
        
        describe("#filterErrors") {
            
            var signal: Signal<Result<(), NSError>, NoError>!
            var observer: Observer<Result<(), NSError>, NoError>!
            var converted: Signal<NSError, NoError>!
            
            beforeEach {
                let (_signal, _observer) = Signal<Result<(), NSError>, NoError>.pipe()
                signal = _signal
                observer = _observer
                converted = signal.filterErrors()
            }
            
            context("When sending a success value") {
                
                it("shouldn't send on the value") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(0))
                        done()
                    }
                    observer.send(value: .success())
                    observer.sendCompleted()
                }}
                
            }
            
            context("When sending a failure value") {
                
                it("should send on the error") { waitUntil { done in
                    converted.collect().observeValues {
                        expect($0.count).to(equal(1))
                        done()
                    }
                    observer.send(value: .failure(NSError(domain: "", code: 0, userInfo: [:])))
                    observer.sendCompleted()
                }}
                
            }
            
        }
        
    }
    
}
