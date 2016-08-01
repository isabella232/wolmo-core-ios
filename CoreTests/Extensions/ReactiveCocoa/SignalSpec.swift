//
//  SignalSpec.swift
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

public class SignalSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#liftError") {
            
            context("When lifting an error") {

                var signal: Signal<(), NSError>!
                
                var observer: Observer<(), NSError>!
                
                beforeEach {
                    let (_signal, _observer) = Signal<(), NSError>.pipe()
                    signal = _signal
                    observer = _observer
                }
                
                it("should ignore the error and complete") {
                    
                    let converted: Signal<(), NoError> = signal.liftError()
                    
                    converted.collect().observeNext {
                        expect($0).to(beEmpty())
                    }
                    
                    observer.sendFailed(NSError(domain: "", code: 0, userInfo: [:]))
                }
            }
            
        }
    }
}
