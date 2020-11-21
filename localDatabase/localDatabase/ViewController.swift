//
//  ViewController.swift
//  localDatabase
//
//  Created by Alptekin Karabacak on 1.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonAction(_ sender: Any) {
        nameLabel.text = "Name: \(nameText.text!)"
        birthLabel.text = "Birthday: \(birthText.text!)"
        
    }
    
}

