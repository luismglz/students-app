//
//  AddBachelorViewController.swift
//  studentsApp
//

import UIKit

class AddBachelorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var inputBachelor: UITextField!
    
    
    
    @IBAction func onAddBachelor(_ sender: Any) {
        let bachelorTxt = inputBachelor.text;
        
        if(bachelorTxt!.isEmpty){
            let alert = UIAlertController(title: "Field required", message: nil, preferredStyle: UIAlertController.Style.alert);
            let action = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in}
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else{
           
            if let text = inputBachelor.text{
                bachelorListData.append(inputBachelor?.text ?? "")
                let alert = UIAlertController(title: "Bachelor added!", message: nil, preferredStyle: UIAlertController.Style.alert);
                let action = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in}
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
        }
    }
        
  }
    
    
    
    
}
