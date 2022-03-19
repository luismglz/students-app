//
//  MenuItem.swift
//  studentsApp
//

import Foundation
import UIKit

struct MenuItem{
    let title: String
    let image: UIImage
}

let actions: [MenuItem] = [
    MenuItem(title: "Student registration", image: UIImage(named: "registerStudent")!),
    MenuItem(title: "Consult Students", image: UIImage(named: "student")!),
    MenuItem(title: "Course registration", image: UIImage(named: "class")!),
   // MenuItem(title: "Grades registration", image: UIImage(named: "score")!),
   // MenuItem(title: "Report of grades", image: UIImage(named: "report")!),
]
