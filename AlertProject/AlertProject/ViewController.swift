//
//  ViewController.swift
//  AlertProject
//
//  Created by Alptekin Karabacak on 15.11.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordAgainText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {
        /*
        let alert = UIAlertController(title: "Error!", message: "Username not found!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            // button clicked
            print("button clicked")
        }
                        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        */
        
        if usernameText.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Enter an username!")
        }
        
        if passwordText.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Enter a password!")
        }
        
        else if passwordText.text != passwordAgainText.text {
            makeAlert(titleInput: "Error", messageInput: "Passwords are not match!")
        }
        else {
            makeAlert(titleInput: "Success", messageInput: "Inputs are ok")
        }
        
    }
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

