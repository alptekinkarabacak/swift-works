//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Alptekin Karabacak on 5.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func getValueClicked(_ sender: Any) {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=c10d8fa938f66bb40122bc674dce5338&format=1")
        let session = URLSession.shared
        // Specify What is gonna happen when this task is started.
        // By the way functions like dataTask named callback functions. (closure)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                if data != nil {
                    do {
                        // Burada as! Dictionary<String, Any> dememizin sebebi Json entrylerinin string fakat esitlik degerlerinin
                        // Herhangi bir deger olmasi
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        // Bunun sebebi aslinda json cekilirken kullanicinin user interface ile etkilesime gecebilmesini engellememek.
                        DispatchQueue.main.async {
                            //print(jsonResponse["rates"]) yapsaydim bana rates icerisindeki degerleri bastiracakti.
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
    }
    
    

}

