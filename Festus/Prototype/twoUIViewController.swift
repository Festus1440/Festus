//
//  twoUIViewController.swift
//  Festus
//
//  Created by Festus Muberuka on 10/13/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit

class twoUIViewController: UIViewController {
    
    @IBOutlet weak var MainContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var SideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(toggleSideMenu),
                                               name: NSNotification.Name("ToggleSideMenu"),
                                               object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func toggleSideMenu() {
        if SideMenuOpen {
            SideMenuOpen = false
            UIView.animate(withDuration: 0.3, animations: {
                self.sideMenuConstraint.constant = -240
                self.MainContainerConstraint.constant = 0
                print (self.SideMenuOpen)
                self.view.layoutIfNeeded()
            })
        } else {
            SideMenuOpen =  true
            UIView.animate(withDuration: 0.3, animations: {
                self.sideMenuConstraint.constant = 0.0
                self.MainContainerConstraint.constant = 240
                print (self.SideMenuOpen)
                self.view.layoutIfNeeded()
            })
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
