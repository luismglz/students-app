//
//  MainMenuViewController.swift
//  studentsApp


import Foundation
import UIKit

let backgroundGrayColor = UIColor(red: 239, green: 186, blue: 186, alpha: 1.0)

class MainMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    

    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionView.tintColor = backgroundGrayColor
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
       // menuCollectionView.collectionViewLayout = UICollectionViewLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuActionsCollectionViewCell", for: indexPath) as! MenuActionsCollectionViewCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 20
        
        cell.setup(with: actions[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        //Open Sign Up View customizing controls
        if(indexPath.row == 0){
            let signInViewController = storyBoard.instantiateViewController(withIdentifier: "SigninView") as! SignInViewController
            signInViewController.modalPresentationStyle = .automatic
            
            self.present(signInViewController, animated: true, completion: nil)
            signInViewController.titleLabelSignUp?.text = "Add Student"
            signInViewController.bachelorLabelTitle.text = "Select student's bachelor"
            signInViewController.btnSignUp?.setTitle("Add student", for: .normal)
            signInViewController.btnSignUp?.frame.size = CGSize(width: 140, height: 42)
            signInViewController.btnSignUp?.tintColor = .systemIndigo
            signInViewController.btnLogIn.isHidden = true
        }
        if(indexPath.row == 1){
            let studentsListNavigation = storyBoard.instantiateViewController(withIdentifier: "studentsListNavigationController") as! UINavigationController
            studentsListNavigation.modalPresentationStyle = .popover
            self.present(studentsListNavigation, animated: true, completion: nil)
        }
        if(indexPath.row == 2){
            let addBachelorView = storyBoard.instantiateViewController(withIdentifier: "AddBachelorView") as! AddBachelorViewController
            addBachelorView.modalPresentationStyle = .popover
            self.present(addBachelorView, animated: true, completion: nil)
        }
    }
    

}

