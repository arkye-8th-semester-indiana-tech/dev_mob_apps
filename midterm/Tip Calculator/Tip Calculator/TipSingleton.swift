//
//  TipModel.swift
//  Tip Calculator
//
//  Created by Maia de Moraes, Jonathan H - 01 on 3/6/16.
//  Copyright © 2016 Jonathan Henrique Maia de Moraes. All rights reserved.
//

import Foundation

class TipSingleton {
    static let sharedInstance = TipSingleton()
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 1
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var tipValue: Double = 0.15
    var tipPercentage: Double = 15.0
    var tipString: String = "15.0%"
    
    private init() {}
    
    func updatePercentage(newPercentage: Double) {
        tipPercentage = newPercentage
        tipValue = tipPercentage/100.0
        let stringValue: String = numberFormatter.stringFromNumber(tipPercentage)!
        tipString = "\(stringValue)%"
    }
}