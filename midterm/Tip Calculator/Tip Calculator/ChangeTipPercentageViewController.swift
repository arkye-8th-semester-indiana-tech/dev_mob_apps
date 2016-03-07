//
//  SecondViewController.swift
//  Tip Calculator
//
//  Created by Maia de Moraes, Jonathan H - 01 on 2/29/16.
//  Copyright © 2016 Jonathan Henrique Maia de Moraes. All rights reserved.
//

import UIKit

class ChangeTipPercentageViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var currentTipPercentageLabel: UILabel!
    
    func updateTipPercentLabel() {
        currentTipPercentageLabel.text = TipSingleton.sharedInstance.tipString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setKeyboard()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        TipSingleton.sharedInstance.updatePercentage(0.0)
        updateTipPercentLabel()
    }
    
    // KEYBOARD
    
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var doubleZeroButton: UIButton!
    @IBOutlet var xButton: UIButton!
    
    func setKeyboard() {
        
        doubleZeroButton.titleLabel?.adjustsFontSizeToFitWidth = true
        doubleZeroButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        doubleZeroButton.titleLabel?.minimumScaleFactor = 0.1
        
        zeroButton.titleLabel?.adjustsFontSizeToFitWidth = true
        zeroButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        zeroButton.titleLabel?.minimumScaleFactor = 0.1
        
        oneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        oneButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        oneButton.titleLabel?.minimumScaleFactor = 0.1
        
        twoButton.titleLabel?.adjustsFontSizeToFitWidth = true
        twoButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        twoButton.titleLabel?.minimumScaleFactor = 0.1
        
        threeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        threeButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        threeButton.titleLabel?.minimumScaleFactor = 0.1
        
        fourButton.titleLabel?.adjustsFontSizeToFitWidth = true
        fourButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        fourButton.titleLabel?.minimumScaleFactor = 0.1
        
        fiveButton.titleLabel?.adjustsFontSizeToFitWidth = true
        fiveButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        fiveButton.titleLabel?.minimumScaleFactor = 0.1
        
        sixButton.titleLabel?.adjustsFontSizeToFitWidth = true
        sixButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        sixButton.titleLabel?.minimumScaleFactor = 0.1
        
        sevenButton.titleLabel?.adjustsFontSizeToFitWidth = true
        sevenButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        sevenButton.titleLabel?.minimumScaleFactor = 0.1
        
        eightButton.titleLabel?.adjustsFontSizeToFitWidth = true
        eightButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        eightButton.titleLabel?.minimumScaleFactor = 0.1
        
        nineButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nineButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        nineButton.titleLabel?.minimumScaleFactor = 0.1
        
        xButton.titleLabel?.adjustsFontSizeToFitWidth = true
        xButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        xButton.titleLabel?.minimumScaleFactor = 0.1
    }

    var minimumNumberMagnitude: Int = -1;
    
    func buttonTapped(buttonID: Int) {
        switch(buttonID) {
        case 10:
            buttonTapped(0)
            buttonTapped(0)
            break;
            
        case 11:
            removeNumber()
            break;
            
        default:
            insertNumber(buttonID)
            break;
        }
            
            updateTipPercentLabel();
    }
    
    func removeNumber() {
        var tipPercentValue = TipSingleton.sharedInstance.tipPercentage
        if tipPercentValue > 0.09 {
            tipPercentValue = tipPercentValue/10.0
            tipPercentValue = floor(tipPercentValue*10)/10
        }
        else {
            tipPercentValue = 0.0
        }
        
        TipSingleton.sharedInstance.updatePercentage(tipPercentValue)
    }
    
    func insertNumber(number: Int) {
        var tipPercentValue = TipSingleton.sharedInstance.tipPercentage
        if tipPercentValue > 10 {
            let alert =  UIAlertController(title: "TipCalculator", message: "Percentage value must be less than 100%", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            tipPercentValue = (tipPercentValue*Double(10)) + (Double(number)*(pow(Double(10),Double(minimumNumberMagnitude))))
        }
        
        TipSingleton.sharedInstance.updatePercentage(tipPercentValue)
    }
    
    @IBAction func oneButtonTapped(sender: AnyObject) {
        buttonTapped(1)
    }
    
    @IBAction func twoButtonTapped(sender: AnyObject) {
        buttonTapped(2)
    }
    
    @IBAction func threeButtonTapped(sender: AnyObject) {
        buttonTapped(3)
    }
    
    @IBAction func fourButtonTapped(sender: AnyObject) {
        buttonTapped(4)
    }
    
    @IBAction func fiveButtonTapped(sender: AnyObject) {
        buttonTapped(5)
    }
    
    @IBAction func sixButtonTapped(sender: AnyObject) {
        buttonTapped(6)
    }
    
    @IBAction func sevenButtonTapped(sender: AnyObject) {
        buttonTapped(7)
    }
    
    @IBAction func eightButtonTapped(sender: AnyObject) {
        buttonTapped(8)
    }
    
    @IBAction func nineButtonTapped(sender: AnyObject) {
        buttonTapped(9)
    }
    
    @IBAction func zeroButtonTapped(sender: AnyObject) {
        buttonTapped(0)
    }
    
    @IBAction func doubleZeroButtonTapped(sender: AnyObject) {
        buttonTapped(10)
    }
    
    @IBAction func xButtonTapped(sender: AnyObject) {
        buttonTapped(11)
    }

}

