//
//  ViewController.swift
//  Festus
//
//  Created by Festus Muberuka on 10/7/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SignUpButton: UIButton!
   
    
    @IBOutlet weak var LogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetUpElements()
        
    }
    
    
    func SetUpElements(){
        Utilities.styleFilledButton(SignUpButton)
        Utilities.styleFilledButton(LogInButton)
    }

}

