//
//  ViewModel.swift
//  DataBindingApp
//
//  Created by Simon Chen on 11/30/16.
//  Copyright © 2016 Workhorse Bytes. All rights reserved.
//

import UIKit
import Bond

class ViewModel: NSObject {
    
    var labelOriginalString: String?
    var labelString = Observable<String?>("")
    var textString = Observable<String?>("")
    
    var isShowingAlertView: Bool = false
    var didSave = Observable<Bool?>(false)
    
    init(originalLabelString: String?, labelString: String?, textString: String?) {
        super.init()
        
        self.labelOriginalString = originalLabelString
        self.labelString.value = labelString
        self.textString.value = textString
    }
    
}
