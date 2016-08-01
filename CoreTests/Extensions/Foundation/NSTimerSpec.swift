//
//  NSTimerSpec.swift
//  Core
//
//  Created by Francisco Depascuali on 7/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Core

public class NSTimerSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#schedule(delay:)") {
            
            
            it("should trigger handler after delay") { waitUntil(timeout: 3) { done in
                NSTimer.schedule(1) { _ in
                    done()
                }
            }}
        }
        
        describe("#schedule(repeat:)") {
            
            it("should repeteadly trigger handler after delay") { waitUntil(timeout: 5) { done in
                var timesCalled = 0
                
                NSTimer.schedule(repeatInterval: 2) { _ in
                    timesCalled += 1
                    
                    if timesCalled == 2 {
                        done()
                    }
                }
            }}
        }
    }
}
