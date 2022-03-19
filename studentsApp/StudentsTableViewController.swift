//
//  StudentsTableViewController.swift
//  studentsApp
//
//

import Foundation
import UIKit

let student = Student()



class StudentsTableViewController:UITableViewController{
    var firstName = [String]()
    var lastName = [String]()
    var username = [String]()
    var password = [String]()
    var bachelor = [String]()
    
    var students=[Student]()
    let defaults = UserDefaults.standard
    
    let pullToRefreshControl = UIRefreshControl()
    
    @IBOutlet var studentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Students list"
        self.studentsTableView.rowHeight = 140
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
        
        //refresh
        self.refreshControl = pullToRefreshControl
        pullToRefreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        
        
        if UserDefaults.standard.object(forKey: "firstName") == nil {
            defaults.set(firstName, forKey: "firstName")

        }
        
        if UserDefaults.standard.object(forKey: "lastName") == nil {
            defaults.set(lastName, forKey: "lastName")

        }
        
        if UserDefaults.standard.object(forKey: "username") == nil {
            defaults.set(username, forKey: "username")

              }

        if UserDefaults.standard.object(forKey: "password") == nil {
            defaults.set(password, forKey: "password")

              }
        
        if UserDefaults.standard.object(forKey: "bachelor") == nil {
            defaults.set(bachelor, forKey: "bachelor")

              }

        
        
        if  ( UserDefaults.standard.object(forKey: "bachelor") != nil ) {
        
            self.firstName = UserDefaults.standard.object(forKey: "firstName") as! [String];
            self.lastName = UserDefaults.standard.object(forKey: "lastName") as! [String];
            self.username = UserDefaults.standard.object(forKey: "username") as! [String]
            self.password = UserDefaults.standard.object(forKey: "password") as! [String]
            self.bachelor = UserDefaults.standard.object(forKey: "bachelor") as! [String]
                          
            students = []
            for i in 0..<firstName.count {
                students.append(Student(avatar: UIImage(named: "student"), name: self.firstName[i], lastname: self.lastName[i], username: self.username[i], password: self.password[i], bachelor: self.bachelor[i], noteCourse1: "10", noteCourse2: "10", noteCourse3: "10"))
                
            }
        }
    }
    
    
    @objc func refreshTable(){
    
        self.tableView.reloadData()
        pullToRefreshControl.endRefreshing()
        
        
    }
    
    //MARK: Table view data source
    //Interfaces
    
    //Return 1 table section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    
    //Fill rows with data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell") as! customCellTableViewCell
        let data = students[indexPath.row]
        
        cell.initialise(firstName: data.name, lastName: data.lastname, bachelor: data.bachelor, image: UIImage(named: "student")!)
    
        return cell
        
    }
    
    
    
    //delete students
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        //create action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            print(indexPath.row)
            print(self.firstName)
            
            
            //remove property from array position
            self.students.remove(at: indexPath.row)
            
            self.firstName.remove(at: indexPath.row)
            
            self.lastName.remove(at: indexPath.row)
            
            self.username.remove(at: indexPath.row)
            
            self.password.remove(at: indexPath.row)
            
            self.bachelor.remove(at: indexPath.row)
            
            
            
            self.defaults.set(self.firstName, forKey: "firstName")
            self.defaults.set(self.lastName, forKey: "lastName")
            self.defaults.set(self.username, forKey: "username")
            self.defaults.set(self.password,forKey: "password")
            self.defaults.set(self.bachelor,forKey: "bachelor")
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            completionHandler(true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let profileViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileView") as? studentProfileViewController{
            
            //pass data from selected index to profile view
            profileViewController.firstNameTxt = students[indexPath.row].name as String
            profileViewController.lastNameTxt = students[indexPath.row].lastname as String
            profileViewController.bachelorTxt = students[indexPath.row].bachelor as String
            
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? studentProfileViewController{
            destination.profileAvatarImage?.image = UIImage(named: "student");
        }
    }
    
}
