//
//  SignInViewController.swift
//  studentsApp
//

import UIKit

var bachelorListData = ["Software Engineering", "Data Science","Mechanical engineering","Biomedical engineering", "Chemical engineering", "Architecture", "Theology", "Statistics", "Dental Medicine"];

class SignInViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate {

    
    @IBOutlet weak var titleLabelSignUp: UILabel?
    
    @IBOutlet weak var btnSignUp: UIButton?
    
    @IBOutlet weak var btnLogIn: UIButton!
    
    
    @IBOutlet weak var bachelorLabelTitle: UILabel!
    
    @IBOutlet weak var txtNameSignIn: UITextField!
    
    @IBOutlet weak var txtLastnameSignIn: UITextField!
    
    @IBOutlet weak var txtUsernameSignIn: UITextField!
    
    @IBOutlet weak var txtPasswordSignIn: UITextField!
    
    @IBOutlet weak var pickerAvatarImageSignIn: UIImageView!
    
    @IBOutlet weak var pickerBachelor: UIPickerView!
    var students  = [Student]()
    var firstName = [String]()
    var lastName = [String]()
    var username = [String]()
    var password = [String]()
    var bachelor = [String]()
    
    
    
    var selectedBachelor = ""
    
    let defaults = UserDefaults.standard
    
    //Number of column sections in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    //number of rows in picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bachelorListData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bachelorListData[row]
    }
    
    
    //select bachelor from picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedBachelor = String(bachelorListData[row])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        titleLabelSignUp?.text = "Sign Up"
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        txtNameSignIn.delegate = self;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        pickerBachelor.dataSource = self
        pickerBachelor.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-160
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboard(){
        txtNameSignIn.resignFirstResponder();
        txtLastnameSignIn.resignFirstResponder();
        txtUsernameSignIn.resignFirstResponder();
        txtPasswordSignIn.resignFirstResponder();
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtNameSignIn.resignFirstResponder();
        return true;
    }
    
    
    @IBAction func btnSignIn(_ sender: Any) {
        
        
        let nameValue = txtNameSignIn.text;
        let lastnameValue = txtLastnameSignIn.text;
        let usernameValue = txtUsernameSignIn.text;
        let passwordValue = txtPasswordSignIn.text;
        let bachelorValue = selectedBachelor;
        
        // check empty fields form
        if(nameValue!.isEmpty || lastnameValue!.isEmpty || usernameValue!.isEmpty || passwordValue!.isEmpty){
            //display alert
            displayAlertMessage(userMessage: "All fields are required")
            return;
        }

        self.firstName = UserDefaults.standard.object(forKey: "firstName") as! [String]
        self.lastName = UserDefaults.standard.object(forKey: "lastName") as! [String]
        self.username = UserDefaults.standard.object(forKey: "username") as! [String]
        self.password = UserDefaults.standard.object(forKey: "password") as! [String]
        self.bachelor = UserDefaults.standard.object(forKey: "bachelor") as! [String]
        
        self.firstName.append(txtNameSignIn.text!)
        self.lastName.append(txtLastnameSignIn.text!)
        self.username.append(txtUsernameSignIn.text!)
        self.password.append(txtPasswordSignIn.text!)
        self.bachelor.append(selectedBachelor)
        
        defaults.set(firstName, forKey: "firstName")
        defaults.set(lastName, forKey: "lastName")
        defaults.set(username, forKey: "username")
        defaults.set(password, forKey: "password")
        defaults.set(bachelor, forKey: "bachelor")
        
 
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainMenuView") as! MainMenuViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    
        
        let alert = UIAlertController(title: "Successfully signed up", message: nil, preferredStyle: UIAlertController.Style.alert);
        //
        let action = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
            
            self.performSegue(withIdentifier: "SegueSigninToMainMenu", sender: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func displayAlertMessage(userMessage: String){
        let alert = UIAlertController(title: userMessage, message: nil, preferredStyle: UIAlertController.Style.alert);
        
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}



