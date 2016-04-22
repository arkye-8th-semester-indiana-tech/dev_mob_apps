//
//  CourseStore.swift
//  CourseTrack
//
//  Created by Maia de Moraes, Jonathan H - 01 on 4/21/16.
//  Copyright © 2016 Jonathan Henrique Maia de Moraes. All rights reserved.
//

import UIKit

class CourseStore {
    var allCourses = [Course]()
    
    let courseArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("items.archive")
    }()
    
    init() {
        if let archivedCourses = NSKeyedUnarchiver.unarchiveObjectWithFile(courseArchiveURL.path!) as? [Course] {
            allCourses += archivedCourses
        }
    }
    
    func createCourse() -> Course {
        let newCourse = Course(name: "Name", number: "Course Number", grade: "C")
        
        allCourses.append(newCourse)
        
        return newCourse
    }
    
    func removeCourse(course: Course) {
        if let index = allCourses.indexOf(course) {
            allCourses.removeAtIndex(index)
        }
    }
    
    func moveCourseAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let movedCourse = allCourses[fromIndex]
            allCourses.removeAtIndex(fromIndex)
            allCourses.insert(movedCourse, atIndex: toIndex)
        }
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(courseArchiveURL.path!)")
        return NSKeyedArchiver.archiveRootObject(allCourses, toFile: courseArchiveURL.path!)
    }
}
