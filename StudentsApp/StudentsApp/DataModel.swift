//
//  DataModel.swift
//  StudentsApp
//
//  Created by Aslan Arapbaev on 10/9/20.
//

import Foundation

class DataModel {
    
    var studentsList = [Student]()
    
    init() {
        loadStudents()
    }
    
    func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("StudentList.plist")
    }
    
    func saveStudents() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(studentsList)
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadStudents() {
        if let data = try? Data(contentsOf: dataFilePath()) {
            let decoder = PropertyListDecoder()
            
            do {
                studentsList = try decoder.decode([Student].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
