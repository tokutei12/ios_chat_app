//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Kim Toy (Personal) on 4/12/17.
//  Copyright © 2017 Codepath. All rights reserved.
//
import Parse
import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCreateNewMessage(_ sender: UIButton) {
        let message = PFObject(className:"Message")
        message["text"] = messageTextField.text
        message.saveInBackground {
            (success, error) -> Void in
            if (success) {
                // The object has been saved.
                print("The object has been saved.")
            } else {
                // There was a problem, check error.description
                print(error?.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
