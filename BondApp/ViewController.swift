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
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var loadButton: UIButton!
    
    var viewModel: ViewModel?
    var dataModel: DataModel?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a View Model
        let viewModel = ViewModel(originalLabelString: self.label.text,
                                  textString: self.textField.text)
        
        
        // Bind view to view model
        self.bindToViewModel(viewModel: viewModel)
        
        
        
        // Bind view model to data model
        let dataModel = DataModel(string: "[No Data]")
        self.bindDataModel(dataModel: dataModel, toViewModel: viewModel)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Binding DataModel to ViewModel
    func bindDataModel(dataModel: DataModel, toViewModel viewModel: ViewModel) {
        self.dataModel = dataModel
        
        // Data Model only changes on Save
        _ = viewModel.didSave.observeNext(with: { didSave in
            if didSave == true {
                dataModel.string = viewModel.textString.value!
                // This will BREAK a test
                //dataModel.string = self.label.text!
                
                self.showAlert(withMessage: "You just saved: \"\(dataModel.string)\"")
            }
        })
    }

    
    // Binding View to ViewModel
    func bindToViewModel(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        // TextField on change events
        _ = self.textField.bnd_text.observeNext() { string in
            if string != "" {
                self.label.text = string
                
                // This will BREAK a test:
                //viewModel.labelOriginalString = ""
            }
            else {
                self.label.text = viewModel.labelOriginalString
            }
            
            // Saving the textString on view model
            if string != viewModel.textString.value {
                viewModel.textString.value = string
                viewModel.didSave.value = false
            }
        }
        
        // OK Button on tapped event
        _ = self.okButton.bnd_tap.observe() {_ in
            // Show UI Alert View
            if viewModel.textString.value != nil {
                self.showAlert(withMessage: viewModel.textString.value!)
            }
        }
        
        // Save Button tapped event
        _ = self.saveButton.bnd_tap.observe() { _ in
            viewModel.didSave.value = true
            self.saveButton.isEnabled = false
        }
        
        // ViewModel.didSave changed to false observer
        _ = self.viewModel?.didSave.observeNext() { didSave in
            if didSave == false {
                self.saveButton.isEnabled = true
            }
        }
    }

    func showAlert(withMessage message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

