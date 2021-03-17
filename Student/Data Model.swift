//
//  Data Model.swift
//  Student
//
//  Created by Atai Akishev on 10/7/20.
//

import Foundation

class DataModel {
    
    var students = [Student]()
    
    init() {
        loadStudentInfo()
        
    }
func documentsDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
}

func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("StudentApp.plist")
}

func saveStudentInfo() {
    let encoder = PropertyListEncoder()
    
    do {
        let data  = try encoder.encode(students)
        try data.write(to: dataFilePath(), options: .atomic)
    } catch {
        print("ERROR: \(error.localizedDescription)")
    }
}

func loadStudentInfo() {
    if let data = try? Data(contentsOf: dataFilePath()) {
        let decoder = PropertyListDecoder()
        do{
            students = try decoder.decode([Student].self, from: data)
        }catch{
            print("ERROR: \(error.localizedDescription)")
        }
    }
}
}
