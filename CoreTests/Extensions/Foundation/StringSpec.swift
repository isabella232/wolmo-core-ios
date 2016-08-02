//
//  CoreTests.swift
//  CoreTests
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//
import Foundation

import Nimble
import Quick
import Core

final class StringSpec: QuickSpec {
    
    // swiftlint:disable function_body_length
    override func spec() {
        
        describe("#length") {
            
            it("should return the string length") {
                let string = "hello"
                expect(string.length()).to(equal(5))
            }
    
        }
        
        describe("#url") {
            
            context("When it is a valid url") {
                
                it("should return the url") {
                    let string = "https://www.google.com.ar/"
                    expect(string.url).toNot(beNil())
                }
            }
            
            context("When it is an invalid url") {
                
                it("should return nil") {
                    let string = "this is invalid"
                    expect(string.url).to(beNil())
                }
            }
        }
        
        describe("#hasSpaces") {
            
            context("When the string doesn't have spaces") {
                
                it("should return false") {
                    let string = "stringwithoutspaces"
                    expect(string.hasSpaces).to(beFalse())
                }
            }
            
            context("When the string has spaces") {
                
                it("should return true") {
                    let string = "string with spaces"
                    expect(string.hasSpaces).to(beTrue())
                }
            }
        }
        
        describe("#isValidEmail") {
            
            context("When the email isn't valid") {
                
                context("When the email doesn't contains @") {
                    
                    it("should return false") {
                        let email = "myemailgmail.com"
                        expect(email.isValidEmail()).to(beFalse())
                    }
                }
                
                context("When the email doesn't contains anything after @") {
                    
                    it("should return false") {
                        let email = "myemail@"
                        expect(email.isValidEmail()).to(beFalse())
                    }
                }
                
                context("When the email doesn't contains anything after .") {
                    
                    it("should return false") {
                        let email = "email@wolox."
                        expect(email.isValidEmail()).to(beFalse())
                    }
                }
            }
            
            context("When the email is valid") {
                
                it("should return true") {
                    let email = "myemail@gmail.com"
                    expect(email.isValidEmail()).to(beTrue())
                }
                
                context("With any provider") {
                    
                    it("should return true") {
                        let email = "some@email.com"
                        expect(email.isValidEmail()).to(beTrue())
                    }
                }
            }
        }
        
        describe("#trimmed") {
            
            context("When the string has whitespaces") {
                var string: String!
                
                beforeEach {
                    string = "   te st@te st.com   "
                }
                
                it("removes leading and trailing whitespaces") {
                    let result = string.trimmed
                    expect(result).to(equal("te st@te st.com"))
                }
                
                it("maintains not leading or trailing spaces") {
                    let string = "This should remain the same"
                    expect(string.trimmed).to(equal(string))
                }
            }
        }
        
        describe("#replacing(with:)") {
            
            context("When the string doesn't contain the target string to replace") {
                
                it("should return the same string") {
                    let string = "this is my string"
                    let replaced = string.replacing("hello", with: "world")
                    expect(string).to(equal(replaced))
                }
            }
            
            context("When the string contains the target string to replace") {
                
                it("should return the string with the target replaced") {
                    let string = "this is my string"
                    let replaced = string.replacing("this", with: "that")
                    expect(replaced).to(equal("that is my string"))
                }
            }
            
        }
        
        describe("#withoutWhiteSpaces") {
            
            context("When a string has whitespaces") {
                
                it("should remove them all") {
                    expect("has whitespaces".withoutWhiteSpaces).to(equal("haswhitespaces"))
                }
            }
            
            context("When a string doesn't have whitespaces") {
                
                it("should return the same string") {
                    expect("nowhitespaces".withoutWhiteSpaces).to(equal("nowhitespaces"))
                }
            }
        }
        
    }
    // swiftlint:enable function_body_length

}
