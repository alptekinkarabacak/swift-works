//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Alptekin Karabacak on 6.12.2020.
//

import UIKit

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        // to enable user can top on imageview
        imageView.isUserInteractionEnabled = true
        let imageTapforSave = UITapGestureRecognizer(target: self, action: #selector(saveSelector))
        imageView.addGestureRecognizer(imageTapforSave)
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func saveSelector() {
        let picker = UIImagePickerController()
        picker.delegate = self
        
    }
    

}
