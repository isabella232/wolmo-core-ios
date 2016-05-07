//
//  CoreTests.swift
//  CoreTests
//
//  Created by Guido Marucci Blas on 5/7/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Nimble
import Quick
import Core

final class StringSpec: QuickSpec {
    
    // swiftlint:disable function_body_length
    override func spec() {
        
        describe("#cleanText") {
            
            context("when the string have whitespaces") {
                var string: String!
                
                beforeEach {
                    string = "   te st@te st.com   "
                }
                
                it("removes leading and trailing whitespaces") {
                    let result = string.cleanText()
                    expect(result).to(equal("te st@te st.com"))
                }
            }
        }
        
    }
    // swiftlint:enable function_body_length

}
