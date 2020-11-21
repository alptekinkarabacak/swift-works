//
//  ViewController.swift
//  TimerApp
//
//  Created by Alptekin Karabacak on 21.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timerLabel.text = "Timer: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction () {
        timerLabel.text = "Timer: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            timerLabel.text = "Time is Over "
        }
        
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
    }
    

}

