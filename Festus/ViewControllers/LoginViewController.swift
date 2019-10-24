//
//  LoginViewController.swift
//  Festus
//
//  Created by Festus Muberuka on 10/7/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var CancelButton: UIButton!
    
    @IBOutlet weak var ErrorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetUpElements()
    }
    
    func SetUpElements(){
        //Hide the Error Label
        ErrorText.alpha = 0
        // Style the elements
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleFilledButton(LogInButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func LogInButtonTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
            
            // Create cleaned versions of the text field
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
                    self.ErrorText.text = error!.localizedDescription
                    self.ErrorText.alpha = 1
                }
                else {
                    
                    self.performSegue(withIdentifier: "Home", sender: self)
                    /*
                    func prepare(for segue: UIStoryboardSegue, sender: Any?){
                        self.dismiss(animated: true, completion: nil)
                    }*/
                    //self.dismiss(animated: true, completion: nil)
                    //guard let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
                    //HomeViewController.modalPresentationStyle = .fullScreen
                    //self.present(HomeViewController, animated: true, completion: nil)
                    //self.navigationController?.pushViewController(HomeViewController, animated: true)
                    //self.view.window?.rootViewController = HomeViewController
                    //self.view.window?.makeKeyAndVisible()
                    }
                }
        }
    
    @IBAction func CancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
    

