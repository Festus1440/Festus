//
//  MenuViewController.swift
//  Festus
//
//  Created by Festus Muberuka on 10/11/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


enum MenuType: Int {
    case home
    case camera
    case profile
}

class MenuViewController: UITableViewController {
    //UI Label
    @IBOutlet weak var UserName: UILabel!
    
    @IBOutlet weak var LogOutButton: UIButton!
    
    var didTapMenuType: ((MenuType) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        FirestoreLoadUsers()
        Utilities.styleFilledButton(LogOutButton)
        // Do any additional setup after loading the view.
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            //ToggleSideMenu()
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
