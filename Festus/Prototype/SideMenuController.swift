//
//  TableViewController.swift
//  Festus
//
//  Created by Festus Muberuka on 10/13/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

enum MenuKind: Int {
    case home
    case profile
    case settings
}

protocol SideSelectionDelegate {
    func didTapChoice(name:String)
}
class SideMenuController: UITableViewController {
    var selectionDelegate: SideSelectionDelegate!
    @IBOutlet weak var UserName: UILabel!
    
    @IBOutlet weak var LogOutButton: UIButton!
    
    var didTapMenuKind: ((MenuKind) -> Void)?
    
    var topView: UIView?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuKind = MenuKind(rawValue: indexPath.row) else { return }
            print("Dismissing: \(menuKind)")
        guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else { return }
        let menuTitle = String(describing: menuKind).capitalized
        //selectionDelegate.didTapChoice(name: (menuTitle))
        print(menuTitle)
        //self.TransitionToNewContent(menuKind, HomeVC)
        //NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        switch menuKind {
        case .profile:
            NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
            self.performSegue(withIdentifier: "profile", sender: self)
        case .settings:
            NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
            self.performSegue(withIdentifier: "settings", sender: self)
        default:
            NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
            break
        //case .home: self.performSegue(withIdentifier: "settings", sender: self)
            }
        //TransitionToNewContent(menuKind, homeViewController: homeViewController)
        //NotificationCenter.default.post(name: NSNotification.Name("changeTitle"), object: nil)
        //print(String(describing: menuKind).capitalized)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirestoreLoadUsers()
        Utilities.styleFilledButton(LogOutButton)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func LogOutTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        print ("signed Out Success")
        guard let viewViewController = storyboard?.instantiateViewController(withIdentifier: "OriginalVC") else { return }
        //let viewViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.viewViewController) as? ViewController
        //present(viewViewController, animated: true)
        
        view.window?.rootViewController = viewViewController
        view.window?.makeKeyAndVisible()
        
        //self.dismiss(animated: true, completion: nil)
        //self.performSegue(withIdentifier: "Logout", sender: self)
    }
    func FirestoreLoadUsers(){
        if Auth.auth().currentUser != nil {
            let userID = Auth.auth().currentUser?.uid
        
            let db = Firestore.firestore()
            //db.collection("Users").addDocument(data: ["Name": "2020", "Age":"20"])
            db.collection("Users").document(userID!).getDocument { (document, error) in
                if let fname = document!.data()!["FirstName"] as? String {
                    self.UserName.reloadInputViews()
                    self.UserName.text = (fname)
                    //self.WelcomeText.alpha = 1
                    }
                }
        }
    }
    
}
