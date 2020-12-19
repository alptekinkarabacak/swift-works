//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Alptekin Karabacak on 6.12.2020.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    var idArray = [UUID]()
    var selectedPainting = ""
    var selectedPaintingId: UUID?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        getData()
        
    }
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Fetching means, getting informations from database.
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject]  {
                    if let name = result.value(forKey: "name") as? String {
                        self.nameArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID {
                        self.idArray.append(id)
                    }
                    self.tableView.reloadData()
                }
                
            }
        } catch {
            print("Error")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVc" {
            let destinationVc = segue.destination as! DetailsVC
            destinationVc.chosenPainting = selectedPainting
            destinationVc.chosenPaintingId = selectedPaintingId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingId = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
    
    @objc func addButtonClicked() {
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // To delete an tableView item we need to get the data will be deleted from Core data.
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let idString = idArray[indexPath.row].uuidString
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let id = result.value(forKey: "id") as? UUID {
                        if id == idArray[indexPath.row] {
                            // Delete Data from Core Data
                            context.delete(result)
                            nameArray.remove(at: indexPath.row)
                            idArray.remove(at: indexPath.row)
                            self.tableView.reloadData()
                            
                            do {
                                try context.save()
                            } catch {
                                print("An Error has OCcured!")
                            }
                            break
                        }
                    }
                }
            }
        } catch  {
            print("An Error has Occured!")
        }
        
        
    }


}

