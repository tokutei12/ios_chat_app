//
//  ViewController.swift
//  ChatApp
//
//  Created by Kim Toy (Personal) on 4/12/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBAction func onSignUp(_ sender: UIButton) {
        myMethod()
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        PFUser.logInWithUsername(inBackground: "myname", password:"mypass") {
            (user, error) -> Void in
            if user != nil {
                // Do stuff after successful login.
                print("Do stuff after successful login.")
            } else {
                // The login failed. Check error to see why.
                print("The login failed. Check error to see why.")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func myMethod() {
        let user = PFUser()
        if let email = emailTextField.text{
            user.username = email
            user.email = email
        }
        if let pass = passwordTextField.text{
            user.password = pass
        }
        // other fields can be set just like with PFObject
        
        print("user: \(user.email) \(user.password)")
        print("emailTextField: \(emailTextField.text)")
        print("passwordTextField: \(passwordTextField.text)")
        
        user.signUpInBackground {
            (succeeded, error) -> Void in
            if let error = error {
                
                // Show the errorString somewhere and let the user try again.
                print("Error: \(error.localizedDescription)")
            } else {
                print("No error!!")
                // Hooray! Let them use the app now.
            }
        }
    }
    

}

