//
//  CellIdentifiableSpec.swift
//  Core
//
//  Created by Francisco Depascuali on 7/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Core

class IdentifiableCellMock: UITableViewCell {}

open class CellIdentifiableSpec: QuickSpec {
    
    override open func spec() {
        
        describe("#cellIdentifier") {
            
            it("should match with the class name") {
                expect(IdentifiableCellMock.cellIdentifier).to(equal("IdentifiableCellMock"))
            }
        }
    }
}
