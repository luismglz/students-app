//
//  LogInViewController.swift
//  studentsApp
//
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtUsernameLogIn: UITextField!
    
    @IBOutlet weak var txtPasswordLogIn: UITextField!
    
    @IBAction func btnViewStudents(_ sender: Any) {
    }
    
    @IBAction func btnLogIn(_ sender: Any) {
        let username = txtUsernameLogIn.text;
        let password = txtPasswordLogIn.text;
        
        // check empty fields form
        if(username!.isEmpty || password!.isEmpty){
            //display alert
            displayAlertMessage(userMessage: "All fields are required")
            return;
        }
        
        //get values from UserDefaults
        let usernameStored = UserDefaults.standard.object(forKey: "username") as! [String]
        let passwordStored = UserDefaults.standard.object(forKey: "password") as! [String]
        
        //Filter data that its equal to texField value
        let filterUsername = usernameStored.filter { user in return user == username}
        let filterPassword = passwordStored.filter { pass in return pass == password}
        print(filterUsername)
        print(filterPassword)
        
        //Get index from data that its equal to texField value
        let indexOfUsername = usernameStored.firstIndex(of: username!)
        let indexOfPassword = passwordStored.lastIndex(of: password!)
        
        
        
        if(filterUsername.contains(username!)){
            if(filterPassword.contains(password!)){
                if(indexOfUsername == indexOfPassword) {
                    
                        let alert = UIAlertController(title: "Login Successful ", message: nil, preferredStyle: UIAlertController.Style.alert);
                        //
                        let action = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                            
                            self.performSegue(withIdentifier: "SegueLoginToMainMenu", sender: nil)
                        }
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }else {
                        let alert = UIAlertController(title: "Data incorrect", message: nil, preferredStyle: UIAlertController.Style.alert);
                        let action = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in}
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }
            }else {
                let alert = UIAlertController(title: "Password does not exist", message: nil, preferredStyle: UIAlertController.Style.alert);
                let action = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in}
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: "Username does not exist", message: nil, preferredStyle: UIAlertController.Style.alert);
            let action = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in}
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsernameLogIn.delegate = self;
        txtPasswordLogIn.delegate = self;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func dismissKeyboard(){
        txtUsernameLogIn.resignFirstResponder();
        txtPasswordLogIn.resignFirstResponder();
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtUsernameLogIn.resignFirstResponder();
        return true;
    }
    
    
    func displayAlertMessage(userMessage: String){
        let alert = UIAlertController(title: userMessage, message: nil, preferredStyle: UIAlertController.Style.alert);
        
        
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
