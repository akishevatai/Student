//
//  AddStudentViewController.swift
//  StudentsApp
//
//  Created by Aslan Arapbaev on 9/30/20.
//

import UIKit

protocol AddStudentVCDelegate: class {
    func addStudentVCDidCancel(_ vc: AddStudentViewController)
    func addStudentVC(_ vc: AddStudentViewController, didFinishAdding student: Student)
    func addStudentVC(_ vc: AddStudentViewController, didFinishEditing student: Student)
}

class AddStudentViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    weak var delegate: AddStudentVCDelegate?
    
    var studentToEdit: Student? // Optional != nil -> EditStudent / Optional == nil -> AddStudent

    override func viewDidLoad() {
        super.viewDidLoad()

        if let student = studentToEdit {
            title = "Edit Student"
            ageTextField.text = String(student.age)
            nameTextField.text = student.name
            phoneTextField.text = student.phone
            emailTextField.text = student.email
            cityTextField.text = student.city
            doneButton.isEnabled = true
        } else {
            title = "Add Student"
        }
    
    }

    @IBAction func cancel() {
        delegate?.addStudentVCDidCancel(self)
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if nameTextField.text != "" && ageTextField.text != "" && phoneTextField.text != "" && emailTextField.text != "" && cityTextField.text != "" {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
    
    
    @IBAction func done() {
        
        if let student = studentToEdit {
            // EDIT
            student.name = nameTextField.text!
            student.age = Int(ageTextField.text!)!
            student.phone = phoneTextField.text!
            student.email = emailTextField.text!
            student.city = cityTextField.text!
            delegate?.addStudentVC(self, didFinishEditing: student)
        } else {
            // ADD
            let newStudent = Student(name: nameTextField.text!, age: Int(ageTextField.text!)!, phone: phoneTextField.text!, email: emailTextField.text!, city: cityTextField.text!)
            delegate?.addStudentVC(self, didFinishAdding: newStudent)
        }
    
    }
   
}
