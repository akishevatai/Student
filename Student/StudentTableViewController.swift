//
//  StudentTableViewController.swift
//  Student
//
//  Created by Atai Akishev on 9/23/20.
//

import UIKit

class StudentTableViewController: UITableViewController, AddStudentVCDelegate {
    
   
    var dataModel: DataModel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      
        
    }
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddStudent" {
            let destinationController = segue.destination as! AddStudentViewController
            destinationController.delegate = self
            
        } else if segue.identifier == "EditStudent" {
            let controller = segue.destination as! AddStudentViewController
            controller.studentToEdit = dataModel.students[sender as! Int]
            controller.delegate = self
    }
        
    }
    

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        dataModel.students.count
        
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell",
                                                 for: indexPath)
        let avatarName = dataModel.students[indexPath.row]
        
        let namelabel = cell.viewWithTag(100) as! UILabel
        let ageLabel = cell.viewWithTag(200) as! UILabel
        let phoneLabel = cell.viewWithTag(300) as! UILabel
        let emailLabel = cell.viewWithTag(400) as! UILabel
        let cityLabel = cell.viewWithTag(500) as! UILabel
        
        
        namelabel.text = dataModel.students[indexPath.row].name
        ageLabel.text = String(dataModel.students[indexPath.row].age)
        phoneLabel.text = dataModel.students[indexPath.row].phone
        emailLabel.text = dataModel.students[indexPath.row].email
        cityLabel.text = dataModel.students[indexPath.row].city
        
        
        cell.imageView!.image = UIImage(named: avatarName.avatarName)
        
        return cell
        
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataModel.students.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditStudent", sender: indexPath.row)
       
    }
    
    func addContent(_ controller: AddStudentViewController) {
        navigationController?.popViewController(animated: true)
       
    }
    
    func addStudent(_ controller: AddStudentViewController,
                    didFinishSaving student: Student) {
        let newIndex = dataModel.students.count
        dataModel.students.append(student)
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .automatic)
        navigationController?.popViewController(animated: true)
        
    }
    func editStudent(_ controller: AddStudentViewController, didFinishEditing student: Student) {
        
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
   
}

