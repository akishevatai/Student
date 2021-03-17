//
//  AvatarPickerViewController.swift
//  Student
//
//  Created by Atai Akishev on 10/9/20.
//

import UIKit
protocol AvatarPickerVCDelegate: class {
    func avatarPicker(_ picker: AvatarPickerViewController, didPick avatarName: String)
}


class AvatarPickerViewController: UITableViewController {
    
    weak var delegate: AvatarPickerVCDelegate?
    
    let avatars = ["Avatar12", "Avatar13", "Avatar14", "Avatar15", "Avatar16", "Avatar17", "Avatar18", "Avatar19", "Avatar20", "Avatar21", "Avatar22", "Avatar23", "Avatar24", "Avatar25", "Avatar26", "Avatar27", "Avatar28", "Avatar29", "Avatar30", "Avatar31", "Avatar32", "Avatar33", "Avatar34", "Avatar35", "Avatar36", "Avatar37", "Avatar38", "Avatar39", "Avatar40", "Avatar41", "Avatar42", "Avatar43", "Avatar44", "Avatar45", "Avatar46", "Avatar47", "Avatar48", "Avatar49", "Avatar50", "Avatar51", "Avatar52", "Avatar53", "Avatar54", "Avatar55", "Avatar56", "Avatar57", "Avatar58", "Avatar59", "Avatar60", "Atai", "Almagul", "Nadira", "Aslan", "Kid Atai","Kunduz", "Aslan Agai", "Juma"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avatars.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell", for: indexPath)
        
        if let c = tableView.dequeueReusableCell(withIdentifier: "AvatarCell") {
            cell = c
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "AvatarCell")
        }
        
        cell.textLabel!.text = avatars[indexPath.row]
        cell.imageView!.image = UIImage(named: avatars[indexPath.row])
        tableView.sizeToFit()
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.avatarPicker(self, didPick: avatars[indexPath.row])
    }
    
    
}
