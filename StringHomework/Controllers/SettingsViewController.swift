//
//  SettingsViewController.swift
//  StringHomework
//
//  Created by Daniil Belyaev on 03.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    @IBOutlet weak var forceSlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBOutlet weak var forceNumber: UILabel!
    @IBOutlet weak var durationNumber: UILabel!
    
    let dataManager = DataManager()
    var pickedAnimation = Animation()
    var pickedCurve = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPicker.delegate = self
        myPicker.dataSource = self
        
        forceSlider.minimumValue = 0.0
        forceSlider.maximumValue = 10.0
        durationSlider.minimumValue = 0.0
        durationSlider.maximumValue = 10.0
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    @IBAction func forceSliderPressed(_ sender: UISlider) {
        forceNumber.text = String(format: "%.1f", forceSlider.value)
    }
    
    @IBAction func durationSliderPressed(_ sender: UISlider) {
        durationNumber.text = String(format: "%.1f", durationSlider.value)
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        guard unwindSegue.identifier == "goBack" else {return}
        guard let destinationVC = unwindSegue.destination as? ViewController else {return}
        guard let duration = Float(durationNumber.text!), let force = Float(forceNumber.text!) else {return}
        
        pickedAnimation.duration = duration
        pickedAnimation.force = force
        pickedAnimation.curve = pickedCurve
        
        destinationVC.pickedAnimation = pickedAnimation
    }

}
extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        dataManager.curves.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        dataManager.curves[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedCurve = dataManager.curves[row]
    }
    
}
