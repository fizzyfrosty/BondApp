//
//  DataModel.swift
//  BondApp
//
//  Created by Simon Chen on 11/30/16.
//  Copyright © 2016 Workhorse Bytes. All rights reserved.
//

import UIKit

class DataModel: NSObject {
    var string: String
    
    init(string: String) {
        self.string = string
        
        super.init()
    }
}
