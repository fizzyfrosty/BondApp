//
//  ViewController.swift
//  BondApp
//
//  Created by Simon Chen on 11/30/16.
//  Copyright © 2016 Workhorse Bytes. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var okButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a View Model
        let viewModel = ViewModel()
        
        // Bind it
        self.bindToViewModel(viewModel: viewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func bindToViewModel(viewModel: ViewModel) {
        // Bind label to textField
        self.textField.bnd_text
            .observeNext(with: {text in
                self.label.text = text
            })
        
        
        // Bind each ViewModel's property
    }

}

