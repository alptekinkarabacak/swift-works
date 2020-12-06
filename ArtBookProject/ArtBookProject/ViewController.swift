//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Alptekin Karabacak on 6.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
    }
    
    @objc func addButtonClicked() {
        performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }


}

