//
//  ViewController.swift
//  BullsEye
//
//  Created by Alican TARIM on 26.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // Global Scope
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    // Interface Builder Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    // Interface Builder Action
    @IBAction func showAlert() {
        print("Hit Me Button ")
        
        let difference: Int = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        //let message = "The value of slider is: \(currentValue) \n The target value is: \(targetValue)"
        let message = "You scored \(points) points."
        
        let alert = UIAlertController(title: "Hello Bulls Eye Game", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK!", style: .default)
        
        alert.addAction(action)
        
        // present is used to show a UI element or a screen
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        currentValue = lroundf(slider.value)
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(currentValue)")
    }
    
    
}

