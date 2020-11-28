//
//  ImageViewController.swift
//  TravelBook
//
//  Created by Alptekin Karabacak on 29.11.2020.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedName = ""
    var selectedImage = UIImage()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageLabel.text = selectedName
        imageView.image = selectedImage
    }
    

}
