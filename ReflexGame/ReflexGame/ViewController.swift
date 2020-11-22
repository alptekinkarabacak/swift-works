//
//  ViewController.swift
//  ReflexGame
//
//  Created by Alptekin Karabacak on 22.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var dogArray = [UIImageView]()
    var highScore = 0

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var doggy1: UIImageView!
    @IBOutlet weak var doggy2: UIImageView!
    @IBOutlet weak var doggy3: UIImageView!
    @IBOutlet weak var doggy4: UIImageView!
    @IBOutlet weak var doggy5: UIImageView!
    @IBOutlet weak var doggy6: UIImageView!
    @IBOutlet weak var doggy7: UIImageView!
    @IBOutlet weak var doggy8: UIImageView!
    @IBOutlet weak var doggy9: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        else if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        // This images can be clicked
        doggy1.isUserInteractionEnabled = true
        doggy2.isUserInteractionEnabled = true
        doggy3.isUserInteractionEnabled = true
        doggy4.isUserInteractionEnabled = true
        doggy5.isUserInteractionEnabled = true
        doggy6.isUserInteractionEnabled = true
        doggy7.isUserInteractionEnabled = true
        doggy8.isUserInteractionEnabled = true
        doggy9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        doggy1.addGestureRecognizer(recognizer1)
        doggy2.addGestureRecognizer(recognizer2)
        doggy3.addGestureRecognizer(recognizer3)
        doggy4.addGestureRecognizer(recognizer4)
        doggy5.addGestureRecognizer(recognizer5)
        doggy6.addGestureRecognizer(recognizer6)
        doggy7.addGestureRecognizer(recognizer7)
        doggy8.addGestureRecognizer(recognizer8)
        doggy9.addGestureRecognizer(recognizer9)
        
        counter = 10
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideViews), userInfo: nil, repeats: true)
        
        dogArray = [doggy1, doggy2, doggy3, doggy4, doggy5, doggy6, doggy7, doggy8, doggy9]
        hideViews()
        
    }
    
    @objc func hideViews() {
        for dog in dogArray {
            dog.isHidden = true
        }
        let selectedNumber = Int(arc4random_uniform(UInt32(dogArray.count - 1)))
        dogArray[selectedNumber].isHidden = false
    }
    
    @objc func increaseScore () {
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    @objc func countDown () {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            for dog in dogArray {
                dog.isHidden = true
            }
            if self.highScore < self.score {
                self.highScore = self.score
                self.highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            
            let alert = UIAlertController(title: "Time is over", message: "Wanna play more", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)

            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideViews), userInfo: nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }


}

