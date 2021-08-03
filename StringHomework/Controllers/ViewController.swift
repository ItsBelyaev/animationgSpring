//
//  ViewController.swift
//  StringHomework
//
//  Created by Daniil Belyaev on 03.08.2021.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: SpringView!
    @IBOutlet weak var animationLabel: UILabel!
    
    var pickedAnimation = Animation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myView.layer.cornerRadius = 20
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationLabel.text = "Animation: \(pickedAnimation.name) \nCurve: \(pickedAnimation.curve) \nForce: \(pickedAnimation.force)\nDuration: \(pickedAnimation.duration)"

    }

    @IBAction func runAnimationgButtonPressed(_ sender: SpringButton) {
        myView.animation = pickedAnimation.name
        myView.curve = pickedAnimation.curve
        myView.force = CGFloat(pickedAnimation.force)
        myView.duration = CGFloat(pickedAnimation.duration)
        myView.delay = 0.2
        
        myView.animate()
        
        sender.animation = "pop"
        sender.duration = 0.5
        sender.animate()
    }
}
