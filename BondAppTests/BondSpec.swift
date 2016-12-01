//
//  BondSpec.swift
//  BondApp
//
//  Created by Simon Chen on 12/1/16.
//  Copyright © 2016 Workhorse Bytes. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import BondApp

class BondSpec: QuickSpec {
    override func spec() {
        
        
        // This tests the UI functionality, by testing the bindings of 'view' to the 'view model'
        describe("the ViewController") {
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as? ViewController
            
            // load the View Controller into memory. This is IMPORTANT
            _ = viewController?.view
            
            let viewModel = (viewController?.viewModel)!
            
            describe("the textfield"){
                let textField: UITextField! = viewController?.textField
                
                context("when it is initially empty") {
                    it("the controller's label equals its original string") {
                        expect(viewController?.label.text).to(equal(viewModel.labelOriginalString))
                    }
                    
                    it("the label's original string is not empty") {
                        expect(viewModel.labelOriginalString).toNot(equal(""))
                    }
                }
                
                context("when it has changed text") {
                    beforeEach {
                        textField.text = "abcdefg"
                        textField.sendActions(for: UIControlEvents.editingChanged)
                    }
                    
                    it("the controller's label equals the textfield's text") {
                        expect(viewController?.label.text).to(equal(textField.text))
                    }
                    
                    context("and when it becomes empty again") {
                        beforeEach {
                            textField.text = ""
                            textField.sendActions(for: UIControlEvents.editingChanged)
                        }
                        
                        it("the label equals its original string") {
                            expect(viewController?.label.text).to(equal(viewModel.labelOriginalString))
                        }
                        
                        it("the original string is also not empty") {
                            expect(viewModel.labelOriginalString).toNot(equal(""))
                        }
                    }
                }
            }
            
            
            
        }
    }
}
