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

private enum IntRepresentable: Int {
    case Zero
    case One
    case Two
    case Three
}

public class RawRepresentableSpec: QuickSpec {
    
    override public func spec() {
        
        describe("#allValues") {
            
            it("should return all values") {
                let allValues = Array(IntRepresentable.allValues(startingAt: .Zero))
                expect(allValues).to(equal([.Zero, .One, .Two, .Three]))
            }
            
            context("When specifying an existent initial value") {
                
                context("When using a rawValue") {
                    
                    it("should return all values after starting at the initial value") {
                        let values = Array(IntRepresentable.allValues(startingAt: .One))
                        expect(values).to(equal([.One, .Two, .Three]))
                    }
                }
                
                it("should return all values after starting at the initial value") {
                    let values = Array(IntRepresentable.allValues(startingAt: .One))
                    expect(values).to(equal([.One, .Two, .Three]))
                }
            }
        }
        
        describe("#count") {
            
            it("should return all values") {
                expect(IntRepresentable.count()).to(equal(4))
            }
            
            context("When specifying an initial value") {
                
                it("should return all values after starting at the initial value") {
                    expect(IntRepresentable.count(startingAt: 1)).to(equal(3))
                }
            }
        }
    }
    
}

public class RawRepresentableGeneratorSpec: QuickSpec {
    
    override public func spec() {
        
        var generator: RawRepresentableGenerator<Int, IntRepresentable>!
        
        beforeEach {
            generator = RawRepresentableGenerator(startingAt: .Zero) { $0 }
        }
        
        describe("#next") {
            
            context("When using the identity function as generator") {
                
                it("should return always the same element") {
                    expect(generator.next()).to(equal(IntRepresentable.Zero))
                    expect(generator.next()).to(equal(IntRepresentable.Zero))
                }
            }
            
            context("When adding one in the generator") {
                
                beforeEach {
                    generator = RawRepresentableGenerator(startingAt: .Zero) { $0 + 1 }
                }
                
                it("should return the following element") {
                    expect(generator.next()).to(equal(IntRepresentable.Zero))
                    expect(generator.next()).to(equal(IntRepresentable.One))
                }
                
            }
        }
    }
}
