//
//  studentProfileViewController.swift
//  studentsApp
//
//

import UIKit

class studentProfileViewController: UIViewController {

    
    @IBOutlet weak var profileBannerImage: UIImageView!
    
    @IBOutlet weak var profileAvatarImage: UIImageView?
    
    @IBOutlet weak var firstNameLabelProfile: UILabel!
    
    @IBOutlet weak var bachelorLabelProfile: UILabel!
    
    
    @IBOutlet weak var lastNameLabelProfile: UILabel!
    
    var firstNameTxt = "";
    var lastNameTxt = "";
    var bachelorTxt = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileAvatarImage?.image = UIImage(named: "student")
        profileAvatarImage?.layer.cornerRadius = 50
        
        //generate random banner image in profile
        profileBannerImage?.image = UIImage(named: "Image\(arc4random_uniform(4)+1)")
        profileBannerImage?.layer.cornerRadius = 30
        
        firstNameLabelProfile.text = firstNameTxt;
        lastNameLabelProfile.text = lastNameTxt;
        bachelorLabelProfile.text = bachelorTxt;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    


}
