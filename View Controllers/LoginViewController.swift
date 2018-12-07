//
//  LoginViewController.swift
//  GG
//
//  Created by Felipe De La Torre on 11/9/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // allow users to sign up
    func signUp() {
        //initialize a user object
        var newUser = PFUser()
        
        // set the new users properties:
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        //calls the sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                self.usernameAlreadyExists()
                
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    
    
    // allows users to login
    func loginUser() {
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                self.loginFailed()
                
            } else {
                print("User logged in successfully")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    
    
    
    //username already taken
    func usernameAlreadyExists(){
        
        let alertController = UIAlertController(title: "Error", message: "Username already exists. Please try a different one.", preferredStyle: .alert)
        
        // add an ok button
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        // add the OK button to the alert controller
        alertController.addAction(OKAction)
        //displays the alert message
        self.present(alertController, animated: true) {
            //end of alert message.
        }
    }
    
    
    
    
    // action when missing field
    func missingField(){
        
        //beginning of alert message:
        //needed to create alert message
        let alertController = UIAlertController(title: "Error", message: "Missing username or password.", preferredStyle: .alert)
        
        // add an ok button
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        // add the OK button to the alert controller
        alertController.addAction(OKAction)
        //displays the alert message
        self.present(alertController, animated: true) {
            //end of alert message.
        }
        
    }
    
    
    
    
    //action for failed authentication
    func loginFailed(){
        
        let alertController = UIAlertController(title: "Error", message: "Incorrect username or password. Please try again.", preferredStyle: .alert)
        
        // add an ok button
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        // add the OK button to the alert controller
        alertController.addAction(OKAction)
        //displays the alert message
        self.present(alertController, animated: true) {
            //end of alert message.
        }
    }
    
    
    //Beginning of actions for buttons
    //action for Login
    @IBAction func onLogin(_ sender: Any) {
        let testPass = (passwordTextField.text?.isEmpty)!
        let testUser = (usernameTextField.text?.isEmpty)!
        if testPass || testUser == true {
            
            missingField()
        } else {
            
            loginUser()
        }
    }
        
    
    //action for Signup
    @IBAction func onSignup(_ sender: Any) {
        let testPass = (passwordTextField.text?.isEmpty)!
        let testUser = (usernameTextField.text?.isEmpty)!
        if testPass || testUser == true {
            
            missingField()
        } else {
            
            signUp()
        }
    }
    //end of actions for buttons

}
