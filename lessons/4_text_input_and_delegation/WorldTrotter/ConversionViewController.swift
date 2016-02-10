//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Maia de Moraes, Jonathan H - 01 on 2/10/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text where !text.isEmpty {
            celsiusLabel.text = textField.text
        }
        else {
            celsiusLabel.text = "???"
        }
    }
}