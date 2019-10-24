//
//  ProfileVC.swift
//  Festus
//
//  Created by Festus Muberuka on 10/18/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
        selector: #selector(oPenNewPage),
        name: NSNotification.Name("OpenNewPage"),
        object: nil)
        //self.navigationController!.navigationBar.tintColor = .blue
        // Do any additional setup after loading the view.
    }
    
    @objc func oPenNewPage() {
        self.performSegue(withIdentifier: "name", sender: self)
    }
    
    @IBAction func DoneTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
