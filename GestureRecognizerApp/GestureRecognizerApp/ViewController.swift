//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Alptekin Karabacak on 21.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true;
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePic() {
        imageView.image = UIImage(named: "lyubalish_2")
        myLabel.text = "First One"
    }
    


}

