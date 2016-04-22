//
//  Course.swift
//  CourseTrack
//
//  Created by Maia de Moraes, Jonathan H - 01 on 4/21/16.
//  Copyright © 2016 Jonathan Henrique Maia de Moraes. All rights reserved.
//

import UIKit

class Course: NSObject, NSCoding {
    var name: String
    var number: String
    var grade: String
    
    init(name: String, number: String, grade: String) {
        self.name = name
        self.number = number
        self.grade = grade
        
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        number = aDecoder.decodeObjectForKey("number") as! String
        grade = aDecoder.decodeObjectForKey("grade") as! String
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(number, forKey: "number")
        aCoder.encodeObject(grade, forKey: "grade")
    }
}
