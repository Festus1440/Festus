//
//  BigContainerView.swift
//  Festus
//
//  Created by Festus Muberuka on 10/14/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit

class BigContainerView: UIView {
    let secondChildVC = HomeVC()
    func viewDidLoad() {
        addSecondChild()
    }

    func addSecondChild(){
        secondChildVC.view.backgroundColor = .blue
        //addChild(secondChildVC)
    }
    
}
