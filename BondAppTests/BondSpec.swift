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
        describe("the ViewController") {
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as? ViewController
            
            // load the View Controller into memory. This is IMPORTANT
            _ = viewController?.view
            
            let viewModel = viewController?.viewModel
            
            describe("the textfield"){
                let textField: UITextField! = viewController?.textField
                
                context("when it is initially empty") {
                    it("the controller's label equals its original string") {
                        expect(viewController?.label.text).to(equal(viewModel?.labelOriginalString))
                    }
                }
                
                context("when it has changed text") {
                    it("the controller's label equals the textfield's text") {
                        textField.text = "abcdefg"
                        textField.sendActions(for: UIControlEvents.editingChanged)
                        
                        expect(viewController?.label.text).to(equal(textField.text))
                    }
                    
                    context("and then it became empty") {
                        it("the label equals its original string") {
                            textField.text = ""
                            textField.sendActions(for: UIControlEvents.editingChanged)
                            
                            expect(viewController?.label.text).to(equal(viewModel?.labelOriginalString))
                        }
                    }
                }
            }
            
            
            
        }
    }
}
