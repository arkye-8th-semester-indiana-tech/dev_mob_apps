//
//  CourseCell.swift
//  CourseTrack
//
//  Created by Maia de Moraes, Jonathan H - 01 on 4/21/16.
//  Copyright © 2016 Jonathan Henrique Maia de Moraes. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    
    func updateFontStyles() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        gradeLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        numberLabel.font = caption1Font
    }
    
    func updateGradeFontColor(grade: String) {
        if grade == "A" || grade == "B" || grade == "C" {
            self.gradeLabel.textColor = UIColor.greenColor()
        } else {
            self.gradeLabel.textColor = UIColor.redColor()
        }
    }
}
