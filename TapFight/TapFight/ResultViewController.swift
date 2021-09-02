//
//  ResultViewController.swift
//  TapFight
//
//  Created on 18.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Your score: \(score)"
        
        let highScore = UserDefaults.standard.integer(forKey: "HighScore")
        if score > highScore {
            UserDefaults.standard.set(score, forKey: "HighScore")
        }
    }
}
