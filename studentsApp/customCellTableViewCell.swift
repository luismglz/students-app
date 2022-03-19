//
//  customCellTableViewCell.swift
//  studentsApp
//
//

import UIKit

class customCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCellLabel: UILabel!
    @IBOutlet weak var lastNameCellLabel: UILabel!
    @IBOutlet weak var bachelorCellLabel: UILabel!
    @IBOutlet weak var avatarCellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initialise(firstName:String,lastName:String,bachelor: String ,image:UIImage){
        
        nameCellLabel.text = firstName
        lastNameCellLabel.text = lastName
        bachelorCellLabel.text = bachelor
        avatarCellImage.image = image
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
