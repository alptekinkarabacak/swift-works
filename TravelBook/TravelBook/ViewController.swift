//
//  ViewController.swift
//  TravelBook
//
//  Created by Alptekin Karabacak on 23.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pictureImages = [UIImage]()
    var pictureNames = [String]()
    var tappedImageName = ""
    var tappedPicture = UIImage()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of row
        return pictureImages.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Defines a cell
        let cell = UITableViewCell()
        cell.textLabel?.text = pictureNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pictureNames.remove(at: indexPath.row)
            pictureImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
   
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        pictureNames.append("Lebron James1")
        pictureNames.append("Lebron James2")
        pictureNames.append("Lebron James3")
        
        pictureImages.append(UIImage(named: "lebron-james1")!)
        pictureImages.append(UIImage(named: "lebron-james2")!)
        pictureImages.append(UIImage(named: "lebron-james-3")!)
        
        navigationItem.title = "Pictures"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoImageView", sender: nil)
        // choosen ones from main tableview
        tappedImageName = pictureNames[indexPath.row]
        tappedPicture = pictureImages[indexPath.row]
        
    }
    // Passing informations between viewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoImageView" {
            let destinationViewController = segue.destination as! ImageViewController
            destinationViewController.selectedName = tappedImageName
            destinationViewController.selectedImage = tappedPicture
            
        }
        
    }


}

