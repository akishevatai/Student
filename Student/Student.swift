//
//  Student.swift
//  Student
//
//  Created by Atai Akishev on 9/23/20.
//

import Foundation

class Student: NSObject, Codable {
    var name: String
    var age: Int
    var phone: String
    var email: String
    var city: String
    var avatarName = "Student"

    init(name: String, age: Int, phone: String, email: String, city: String) {
        self.name = name
        self.age = age
        self.phone = phone
        self.email = email
        self.city = city
    }
    
    
    
   
}
