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
        let alert = UIAlertController(title: "Error!", message: "Username not found!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (<#UIAlertAction#>) in
            // Button clicked
            print("Cancel Button Clicked")

        }
                        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

