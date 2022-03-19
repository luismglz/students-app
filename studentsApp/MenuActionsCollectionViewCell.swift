//
//  MenuActionsCollectionViewCell.swift
//  studentsApp
//
//

import UIKit

class MenuActionsCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var itemActionImage: UIImageView!
    
    @IBOutlet weak var itemActionTitle: UILabel!
    

    
    func setup(with menuItem: MenuItem){
        itemActionImage.image = menuItem.image
        itemActionTitle.text = menuItem.title
    }
}
