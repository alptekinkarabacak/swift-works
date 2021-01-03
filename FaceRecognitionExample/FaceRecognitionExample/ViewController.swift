//
//  ViewController.swift
//  FaceRecognitionExample
//
//  Created by Alptekin Karabacak on 3.01.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        let authContext = LAContext()
        var error: NSError?
        
        // Check the capability of phone which our app run on.
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // Called a closure or closure TODO: Google it!
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Im going to check") { (success, error) in
                if success == true {
                    // succesfully authenticated
                    DispatchQueue.main.async {
                        // We do that, because authentication works on background thread but segue or label actions must work on
                        // the main thread.
                        self.performSegue(withIdentifier: "toSecondVc", sender: nil)
                    }

                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                }
            }
            
        }
    }
    
}

