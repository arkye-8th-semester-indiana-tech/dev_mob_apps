//
//  CourseTableViewController.swift
//  CourseTrack
//
//  Created by Maia de Moraes, Jonathan H - 01 on 4/21/16.
//  Copyright © 2016 Jonathan Henrique Maia de Moraes. All rights reserved.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    var courseStore: CourseStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    @IBAction func addNewCourse(sender: AnyObject) {
        let newCourse = courseStore.createCourse()
        
        if let index = courseStore.allCourses.indexOf(newCourse) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCourse" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let course = courseStore.allCourses[row]
                let courseViewController = segue.destinationViewController as! CourseViewController
                courseViewController.course = course
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseStore.allCourses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CourseCell", forIndexPath: indexPath) as! CourseCell
        
        cell.updateFontStyles()
        
        let course = courseStore.allCourses[indexPath.row]
        
        cell.updateGradeFontColor(course.grade)
        
        cell.nameLabel.text = course.name
        cell.numberLabel.text = course.number
        cell.gradeLabel.text = course.grade
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let course = courseStore.allCourses[indexPath.row]
            courseStore.removeCourse(course)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        courseStore.moveCourseAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
}
