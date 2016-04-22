//
//  CourseViewController.swift
//  CourseTrack
//
//  Created by Maia de Moraes, Jonathan H - 01 on 4/21/16.
//  Copyright © 2016 Jonathan Henrique Maia de Moraes. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var gradePicker: UIPickerView!
    
    var course: Course! {
        didSet {
            navigationItem.title = course.name
        }
    }
    
    var gradeOptions = ["A", "B", "C", "D", "E", "F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradePicker.dataSource = self
        gradePicker.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = course.name
        numberField.text = course.number
        gradePicker.selectRow(getGradeIndex(course.grade), inComponent: 0, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        course.name = nameField.text ?? "Course Name"
        course.number = numberField.text ?? "Course Number"
        course.grade = getGradeOption()
    }
    
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func getGradeIndex(grade: String) -> Int {
        for index in 0...gradeOptions.count {
            if(grade == gradeOptions[index]) {
                return index
            }
        }
        return 0
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func getGradeOption( ) -> String {
        
        return gradeOptions[gradePicker.selectedRowInComponent(0)]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gradeOptions.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradeOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        course.grade = gradeOptions[row]
    }
}
