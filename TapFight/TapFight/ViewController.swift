//
//  ViewController.swift
//  TapFight
//
//  Created on 11.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var highScoreLabel: UILabel!
    static var TIME = 10
    var timer: Timer?
    var timeLeft = TIME
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareInitials()
        prepareUI()
    }
    
    func prepareInitials() {
        timeLeft = ViewController.TIME
        score = 0
        timerLabel.text = "Time Left: \(timeLeft)"
        startButton.setTitle("Start", for: .normal)
        let highScore = UserDefaults.standard.integer(forKey: "HighScore")
        highScoreLabel.text = "High Score: \(highScore)"
    }
    
    func prepareUI() {
        startButton.layer.borderColor = UIColor.darkGray.cgColor
        startButton.layer.borderWidth = 1
    }
    
    func fire() {
        timeLeft -= 1
        timerLabel.text = "Time Left: \(timeLeft)"
        
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
            timeLeft = ViewController.TIME
            
            let resultStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let resultViewController = resultStoryboard.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
            resultViewController.score = self.score
            self.navigationController?.pushViewController(resultViewController, animated: true)
        }
    }
    
    func performScore() {
        if timeLeft > 0 {
            score += 1
        }
        startButton.setTitle("\(score)", for: .normal)
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                self.fire()
            })
        }
        performScore()
    }
    
}

