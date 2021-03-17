//
//  AddStudentViewController.swift
//  Student
//
//  Created by Atai Akishev on 9/25/20.
//

import UIKit

protocol AddStudentVCDelegate: class {
    func addContent(_ controller: AddStudentViewController)
    func addStudent(_ controller: AddStudentViewController, didFinishSaving student: Student)
    func editStudent(_ controller: AddStudentViewController, didFinishEditing student: Student)
}


class AddStudentViewController: UIViewController, AvatarPickerVCDelegate {
   
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var addAvatarButton: UIButton!
   
    
    weak var delegate: AddStudentVCDelegate? = nil
    var studentToEdit: Student?
    var avatarName = "Student"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let info = studentToEdit{
//            title = "Edit Student"
//            nameTextField.text = info.name
//            ageTextField.text = String(info.age)
//            phoneTextField.text = info.phone
//            emailTextField.text = info.email
//            cityTextField.text = info.city
//            saveBarButtonItem.isEnabled = true
//            avatarImage.image = UIImage(named: info.avatarName)
//        } else {
//           title = "Add Student"
//
//        }
//
//        cityTextField.resignFirstResponder()
//
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "avatar" {
            let destination = segue.destination as! AvatarPickerViewController
            
            destination.delegate = self
        }
    }
    
    
   

    //MARK: - Actions
    
    @IBAction func editingDidChanged(_ sender: UITextField) {
        if nameTextField.text != "" && ageTextField.text != "" && phoneTextField.text != "" && emailTextField.text != "" && cityTextField.text != "" {
            saveBarButtonItem.isEnabled = true
        } else {
            saveBarButtonItem.isEnabled = false
        }
        
    }
    
    
    
    @IBAction func saveButton() {
        if let student = studentToEdit {
            student.name = nameTextField.text!
            student.age = Int(ageTextField.text!)!
            student.phone = phoneTextField.text!
            student.email = emailTextField.text!
            student.city = cityTextField.text!
            student.avatarName = avatarName
            delegate?.editStudent(self, didFinishEditing: student)
        }else{
            
             let student = Student(name: nameTextField.text!, age: Int(ageTextField.text!)!, phone: phoneTextField.text!, email: emailTextField.text!, city: cityTextField.text!)
            student.avatarName = avatarName
            delegate?.addStudent(self, didFinishSaving: student)
       
    }
       
    }
    
    func avatarPicker(_ picker: AvatarPickerViewController, didPick avatarName: String) {
        self.avatarName = avatarName
        avatarImage.image = UIImage(named: avatarName)
        navigationController?.popViewController(animated: true)
    }

}

