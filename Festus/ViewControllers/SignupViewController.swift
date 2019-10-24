//
//  SignupViewController.swift
//  Festus
//
//  Created by Festus Muberuka on 10/7/19.
//  Copyright © 2019 Festus Muberuka. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var CancelButton: UIButton!
    
    @IBOutlet weak var ErrorText: UILabel!
    
    var activeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetUpElements()  //Instance function of the styled elements
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // Style the Signup Elements and hide Error Label
    func SetUpElements(){
        ErrorText.alpha = 0
        Utilities.styleTextField(FirstNameTextField)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleFilledButton(SignUpButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func ValidateFields() -> String? {
        
        // Check that all fields are filled in
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let CleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(CleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    @IBAction func SignUpTapped(_ sender: Any) {
        
        // Validate the fields
            let Error = ValidateFields()
            
            if Error != nil {
                
                // There's something wrong with the fields, show error message
                showError(Error!)
            }
            else {
                
                // Create cleaned versions of the data
                let firstName = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Create the user
                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    
                    // Check for errors
                    if err != nil {
                        // There was an error creating the user
                        self.ErrorText.alpha = 1
                        self.ErrorText.text = err!.localizedDescription
                        //self.showError("Error creating user")
                        return
                    }
                    else {
                        let db = Firestore.firestore()
                        let UsersRef = db.collection("Users")
                        UsersRef.document(result!.user.uid).setData([
                            "FirstName":firstName,
                            "booleanExample": true,
                            "Email": result!.user.email!,
                            "uid": result!.user.uid]) { (error) in
                            
                            if error != nil {
                                // Show error message
                                self.ErrorText.text = error!.localizedDescription
                                self.ErrorText.alpha = 0
                                //self.showError("Error saving user data")
                            }
                        }
                        
                        // Transition to the home screen
                        self.performSegue(withIdentifier: "Home", sender: self)
                        //self.TransitionToHome()
                        //self.dismiss(animated: true, completion: nil)
                    }
                    
                }
                
                
                
            }
        }
        
        func showError(_ message:String) {
            
            ErrorText.text = message
            ErrorText.alpha = 1
        }
    
        @IBAction func CancelButtonTapped(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }
        
        func TransitionToHome() {
            
            guard let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
            self.view.window?.rootViewController = HomeViewController
            self.view.window?.makeKeyAndVisible()
            
        }
    
}
