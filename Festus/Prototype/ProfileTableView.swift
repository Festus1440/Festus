//
//  ProfileTableView.swift
//  Festus
//
//  Created by Festus Muberuka on 10/17/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class ProfileTableView: UITableViewController {
    
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Email2: UILabel!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserName2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        FirestoreLoadUsers()
        // Do any additional setup after loading the view.
    }
    func FirestoreLoadUsers(){
        if Auth.auth().currentUser != nil {
            let userID = Auth.auth().currentUser?.uid
        
            let db = Firestore.firestore()
            //db.collection("Users").addDocument(data: ["Name": "2020", "Age":"20"])
            db.collection("Users").document(userID!).getDocument { (document, error) in
                if let fname = document!.data()!["FirstName"] as? String {
                    self.UserName.text = (fname)
                    self.UserName2.text = (fname)
                    self.UserName.reloadInputViews()
                    }
                if let email = document!.data()!["Email"] as? String {
                    self.Email.text = (email)
                    self.Email2.text = (email)
                    self.Email.reloadInputViews()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped: \(indexPath)")
        NotificationCenter.default.post(name: NSNotification.Name("OPenNewPage"), object: nil)
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
