//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Maia de Moraes, Jonathan H - 01 on 2/10/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLabel: UILabel!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            
            var isTextFieldAccepted = false
            
            let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
            let replacementTextHasDecimalSeparator = string.rangeOfString(".")
            
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                isTextFieldAccepted = false
            }
            else {
                let replacementTextHasAlphabeticCharacter = string.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet())
                
                
                if replacementTextHasAlphabeticCharacter != nil {
                    isTextFieldAccepted = false
                }
                else {
                    isTextFieldAccepted = true
                }
            }

            return isTextFieldAccepted
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let currentDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let dateHour = calendar.component(NSCalendarUnit.Hour, fromDate: currentDate)
        let minimumEveningHour = 18
        
        if dateHour > minimumEveningHour {
            self.view.backgroundColor = UIColor.lightGrayColor()
        }
        else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
    }
}