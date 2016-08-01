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

public class UITextFieldSpec: QuickSpec {
    
    override public func spec() {

        describe("#next") {
            
            context("When there isn't next textfield associated") {
            
                it("should be nil") {
                    let textField = UITextField()
                    expect(textField.next).to(beNil())
                }
            }
            
            context("When there is a next textfield associated") {
                
                var textField: UITextField!
                
                beforeEach {
                    textField = UITextField()
                    let nextTextField = UITextField()
                    nextTextField.text = "next"
                    textField.next = nextTextField
                }
                
                it("should return the next textfield") {
                    expect(textField.next).toNot(beNil())
                    expect(textField.next?.text!).to(equal("next"))
                }
                
                context("When the next textField is changed") {
                    
                    beforeEach {
                        let nextTextField = UITextField()
                        nextTextField.text = "changed"
                        textField.next = nextTextField
                    }
                    
                    it("should return the new textfield") {
                        
                        expect(textField.next).toNot(beNil())
                        print(textField.next!.text)
                        expect(textField.next?.text!).to(equal("changed"))
                    }
                }
            }
            
        }
    }
}
