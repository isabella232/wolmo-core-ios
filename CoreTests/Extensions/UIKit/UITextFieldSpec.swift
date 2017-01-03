//
//  UITextFieldSpec.swift
//  Core
//
//  Created by Francisco Depascuali on 7/15/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Core

open class UITextFieldSpec: QuickSpec {
    
    override open func spec() {

        describe("#nextTextField") {
            
            context("When there isn't next textfield associated") {
            
                it("should be nil") {
                    let textField = UITextField()
                    expect(textField.nextTextField).to(beNil())
                }
            }
            
            context("When there is a next textfield associated") {
                
                var textField: UITextField!
                var nextTextField: UITextField!
                
                beforeEach {
                    textField = UITextField()
                    nextTextField = UITextField()
                    textField.nextTextField = nextTextField
                }
                
                it("should return the next textfield") {
                    expect(textField.nextTextField).toNot(beNil())
                    expect(textField.nextTextField!).to(equal(nextTextField))
                }
                
                context("When the next textField is changed") {
                    
                    var otherTextField: UITextField!
                    
                    beforeEach {
                        otherTextField = UITextField()
                        textField.nextTextField = otherTextField
                    }
                    
                    it("should return the new textfield") {
                        expect(textField.nextTextField).toNot(beNil())
                        expect(textField.nextTextField!).to(equal(otherTextField))
                    }
                }
            }
            
        }
    }
}
