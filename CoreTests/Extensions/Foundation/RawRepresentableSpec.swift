//
//  RawRepresentable.swift
//  Core
//
//  Created by Francisco Depascuali on 7/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Core

private enum IntGenerator: Int {
    case Zero
    case One
    case Two
    case Three
}

public class RawRepresentableSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#allValues") {
            
            it("should return all values") {
                let allValues = Array(IntGenerator.allValues())
                expect(allValues).to(equal([.Zero, .One, .Two, .Three]))
            }
            
            context("When specifying an initial value") {
                
                it("should return all values after starting at the initial value") {
                    let values = Array(IntGenerator.allValues(startingAt: 1))
                    expect(values).to(equal([.One, .Two, .Three]))
                }
            }
        }
        
        describe("#count") {
            
            it("should return all values") {
                expect(IntGenerator.count()).to(equal(4))
            }
            
            context("When specifying an initial value") {
                
                it("should return all values after starting at the initial value") {
                    expect(IntGenerator.count(startingAt: 1)).to(equal(3))
                }
            }
        }
    }
    
}

public class RawRepresentableGeneratorSpec: QuickSpec {
    
    override public func spec() {
        
        var generator: RawRepresentableGenerator<Int, IntGenerator>!
        
        beforeEach {
            generator = RawRepresentableGenerator(baseRawValue: 0) { $0 }
        }
        
        describe("#next") {
            
            context("When using the identity function as generator") {
                
                it("should return always the same element") {
                    expect(generator.next()).to(equal(IntGenerator.Zero))
                    expect(generator.next()).to(equal(IntGenerator.Zero))
                }
            }
            
            context("When adding one in the generator") {
                
                beforeEach {
                    generator = RawRepresentableGenerator(baseRawValue: 0) { $0 + 1 }
                }
                
                it("should return the following element") {
                    expect(generator.next()).to(equal(IntGenerator.Zero))
                    expect(generator.next()).to(equal(IntGenerator.One))
                }
                
            }
        }
    }
}
