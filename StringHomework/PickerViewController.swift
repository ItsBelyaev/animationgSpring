//
//  PickerViewController.swift
//  StringHomework
//
//  Created by Daniil Belyaev on 03.08.2021.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let animations = ["shake", "pop", "morph", "squeeze", "wobble","swing", "flipX", "flipY", "fall", "squeezeLeft", "squeezeRight", "squeezeDown", "squeezeUp", "slideDown", "slideUp", "slideLeft", "slideRight", "fadeIn", "fadeOut", "fadeInLeft", "fadeInRight", "fadeInDown", "fadeInUp", "zoomIn", "zoomOut", "flash" ]

    var pickedAnimation = ""

    @IBOutlet weak var myPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPicker.delegate = self
        myPicker.dataSource = self
        
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goBack", sender: self)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goBack" else {return}
        guard let destinationVC = segue.destination as? ViewController else {return}
        destinationVC.animationToUse = pickedAnimation
    }
    //Category: PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
          }
          
          func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return animations[row]
          }
          
          func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            pickedAnimation = animations[row]
            print(pickedAnimation)
          }
    
    
    
        
    
    
}
