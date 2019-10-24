//
//  HomeViewController.swift
//  Festus
//
//  Created by Festus Muberuka on 10/7/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    let transiton = SlideTransitions()
    var topView: UIView?

    @IBOutlet weak var WelcomeText: UILabel!
    
    @IBOutlet weak var LogOut: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(LogOut)
        //LoadUserSettings()
        FirestoreLoadUsers()
        
        //LoadUserData()
        // Do any additional setup after loading the view.
    }
    
    
    // Read Firebase Database
    func LoadUserSettings(){
    //var ref: DatabaseReference!
    let ref = Database.database().reference()

    let userI = Auth.auth().currentUser?.uid
        ref.child("Users").child(userI!).child("FirstName").observeSingleEvent(of: .value, with: { (snapshot) in
        // Get user value
            let value = snapshot.value as? String
            self.WelcomeText.reloadInputViews()
            self.WelcomeText.text = "Welcome \(value!)"
            
        })
    }
    
    // Check for specific value in Firestore
    func LoadUserData(){
        let db = Firestore.firestore()
        db.collection("Users").whereField("FirstName", isEqualTo: "Festus").getDocuments { (snapshot, error) in
            if error != nil{
                //print(error)
            }
            else {
                for document in (snapshot?.documents)!{
                    if let name = document.data()["LastName"] as? String {
                    self.WelcomeText.reloadInputViews()
                    self.WelcomeText.text = "Welcome \(name)"
                    }
                }
            }
        }
    }
    // Read Firestore database
    func FirestoreLoadUsers(){
        if Auth.auth().currentUser != nil {
            let userID = Auth.auth().currentUser?.uid
        
            let db = Firestore.firestore()
            //db.collection("Users").addDocument(data: ["Name": "2020", "Age":"20"])
            db.collection("Users").document(userID!).getDocument { (document, error) in
                if let name = document!.data()!["FirstName"] as? String {
                    //if name == nil {} else{
                    self.WelcomeText.reloadInputViews()
                    self.WelcomeText.text = "Welcome, \(name)"
                    self.WelcomeText.alpha = 1
                    //}
                }
        }
    }
}
    // Pressed logout button
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
    
   /*
    func TransitionToNewContent(_ menuKype: MenuKind) {
    let title = String(describing: menuKind).capitalized
    self.title = title

    topView?.removeFromSuperview()
    switch menuKind {
    case .profile:
        let view = UIView()
        view.backgroundColor = .green
        view.frame = self.view.bounds
        self.view.addSubview(view)
        self.topView = view
    case .camera:
        let view = UIView()
        view.backgroundColor = .blue
        view.frame = self.view.bounds
        self.view.addSubview(view)
        self.topView = view
    default:
        break
        }
    }
 */
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    extension HomeViewController: UIViewControllerTransitioningDelegate {
        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
        }

        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
        }
    }
