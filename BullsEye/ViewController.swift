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
        setupSlider()
    }
    
    func setupSlider() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHiglighted = UIImage(named: "SliderThumb-Higligtted")
        slider.setThumbImage(thumbImageHiglighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        
        
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
        var points = 100 - difference
        score += points
        
        let title: String
        
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            points += 50
        } else if difference < 10 {
            title = "Pretty Good"
        } else {
            title = "Not event close"
        }
        
        //let message = "The value of slider is: \(currentValue) \n The target value is: \(targetValue)"
        let message = "You scored \(points) points."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK!", style: .default) { _ in
            self.startNewRound()
        }
        
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
    
    @IBAction func startOver() {
        startNewGame()
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        
        applyAnimation()
    }
    
    // Core Animation
    func applyAnimation() {
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 2
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        
        view.layer.add(transition, forKey: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(currentValue)")
    }
    
    
}

