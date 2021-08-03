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
    
    var animationToUse = "shake"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myView.layer.cornerRadius = 20
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationLabel.text = animationToUse

    }

    @IBAction func runAnimationgButtonPressed(_ sender: SpringButton) {
        myView.animation = animationLabel.text ?? "shake"
        myView.curve = "easeInOut"
        myView.force = 2
        myView.duration = 2
        myView.delay = 0.2
        
        myView.animate()
        
        sender.animation = "pop"
        sender.duration = 0.5
        sender.animate()
        
        print(animationToUse)
        guard let animation = animationLabel.text else {return}
        print(animation)
        
    }
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        
    }

}
