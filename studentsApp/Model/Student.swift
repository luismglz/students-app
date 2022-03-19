//
//  Student.swift
//  studentsApp
//
//

import Foundation
import UIKit


struct Student{
    var avatar : UIImage!
    var name = String()
    var lastname = String()
    var username = String()
    var password = String()
    var bachelor = String()
    var noteCourse1 = String()
    var noteCourse2 = String()
    var noteCourse3 = String()
}

var students : [Student] = [
    Student(avatar: UIImage(named: "student.png"), name: "John", lastname: "Doe", username: "johndoe10", password: "12345", bachelor: "Electrical Engineering", noteCourse1: "10", noteCourse2: "8", noteCourse3: "9")
]


