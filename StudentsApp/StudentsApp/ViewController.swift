//
//  ViewController.swift
//  StudentsApp
//
//  Created by Aslan Arapbaev on 9/25/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddStudentVCDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataModel: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddStudent" {
            let destinationVC = segue.destination as! AddStudentViewController
            
            destinationVC.delegate = self
            
        } else if segue.identifier == "EditStudent" {
            let destinationVC = segue.destination as! AddStudentViewController
            
            destinationVC.studentToEdit = dataModel.studentsList[sender as! Int]
            destinationVC.delegate = self
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.studentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        let nameLabel = cell.viewWithTag(100) as! UILabel
        let ageLabel = cell.viewWithTag(200) as! UILabel
        let phoneLabel = cell.viewWithTag(300) as! UILabel
        let cityLabel = cell.viewWithTag(400) as! UILabel
        let emailLabel = cell.viewWithTag(500) as! UILabel
        
        nameLabel.text = dataModel.studentsList[indexPath.row].name
        ageLabel.text = String(dataModel.studentsList[indexPath.row].age)
        phoneLabel.text = dataModel.studentsList[indexPath.row].phone
        cityLabel.text = dataModel.studentsList[indexPath.row].city
        emailLabel.text = dataModel.studentsList[indexPath.row].email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataModel.studentsList.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditStudent", sender: indexPath.row)
    }
    
    
    // MARK: - AddStudentVC Delegate
    
    func addStudentVCDidCancel(_ vc: AddStudentViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addStudentVC(_ vc: AddStudentViewController, didFinishAdding student: Student) {
        let newIndex = dataModel.studentsList.count
        dataModel.studentsList.append(student)
        
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .automatic) // adding to view
        
        navigationController?.popViewController(animated: true)
    }
    
    func addStudentVC(_ vc: AddStudentViewController, didFinishEditing student: Student) {
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}


/*
 1. download avatars (min 10) www.flaticon.com
 2. avatars -> 1x, 2x, 3x -> www.appicon.co
 3. AddStudentViewController -> cell (avatar   image[👤]) ->
 4. New Controller (AvatarPickerVC) UITableViewController
 */
