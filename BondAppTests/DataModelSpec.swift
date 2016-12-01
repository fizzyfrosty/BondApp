//
//  DataModelSpec.swift
//  BondApp
//
//  Created by Simon Chen on 12/1/16.
//  Copyright © 2016 Workhorse Bytes. All rights reserved.
//

import Quick
import Nimble

@testable import BondApp

class DataModelSpec: QuickSpec {
    

    override func spec() {
        // Test the view-model and data-model bindings
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as? ViewController
        
        // load the View Controller into memory. This is IMPORTANT
        _ = viewController?.view
        
        
        describe("the view model") {
            let viewModel = (viewController?.viewModel)!
            let dataModel = (viewController?.dataModel)!
            
            context("when ready to save") {
                beforeEach {
                    viewModel.didSave.value = false
                }
                
                context("when empty") {
                    beforeEach {
                        viewModel.textString.value = ""
                    }
                    
                    context("when saved") {
                        beforeEach {
                            viewModel.didSave.value = true
                        }
                        
                        it("data model's string equals an empty string") {
                            expect(dataModel.string).to(equal(""))
                        }
                    }
                }
                
                context("when saved textfield's text changed") {
                    let changedString = "string123"
                    
                    beforeEach {
                        viewModel.textString.value = changedString
                    }
                    
                    context("when saved") {
                        beforeEach {
                            viewModel.didSave.value = true
                        }
                        
                        it("data model's string equals the textField text value") {
                            expect(dataModel.string).to(equal(changedString))
                        }
                    }
                }
            }
        }
    }
    
    
}
