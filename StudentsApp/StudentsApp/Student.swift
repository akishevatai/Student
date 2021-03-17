//
//  Student.swift
//  StudentsApp
//
//  Created by Aslan Arapbaev on 9/25/20.
//

import Foundation

class Student: Codable {
    var name: String
    var age: Int
    var phone: String
    var email: String
    var city: String
    
    init(name: String, age: Int, phone: String, email: String, city: String) {
        self.name = name
        self.age = age
        self.phone = phone
        self.email = email
        self.city = city
    }
}
