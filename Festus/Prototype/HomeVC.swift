//
//  HomeVC.swift
//  Festus
//
//  Created by Festus Muberuka on 10/13/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let secondChildVC = MainView()
    
    @IBOutlet weak var Page2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        addSecondChild()
        //view.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func MoreTapped(){
        print ("Tapped")
        guard let sideMenuController = storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? SideMenuController else { return }
        sideMenuController.selectionDelegate = self
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    @IBAction func Page2Tapped(_ sender: Any) {
        guard let twoUIViewController = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? twoUIViewController else { return }
    }
    func addSecondChild(){
        secondChildVC.backgroundColor = .green
        //addChild(secondChildVC)
        
    }
    
    @objc func ChangeTitle(){
        self.performSegue(withIdentifier: "profile", sender: self)
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

extension HomeVC: SideSelectionDelegate {
    func didTapChoice(name: String) {
        //self.title = name
    }
}
