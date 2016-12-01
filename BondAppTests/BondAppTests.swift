//
//  BondAppTests.swift
//  BondAppTests
//
//  Created by Simon Chen on 11/30/16.
//  Copyright © 2016 Workhorse Bytes. All rights reserved.
//

import XCTest
@testable import BondApp

class BondAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // THIS IS CRAZY. A view controller does NOT load into memory, but calling its .VIEW property forces it to load!!!!
    // http://kaspermunck.github.io/2012/10/testing-a-view-controllers-iboutlet-connections/
    func testViewControllerFromStoryboardIsNotNil() {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        let viewModel = viewController?.viewModel
        
        // This is the Magical line right here!! If this didn't exist, any property in the view controller turns up nil
        _ = viewController?.view
        
        
        XCTAssert(viewController?.viewModel != nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
