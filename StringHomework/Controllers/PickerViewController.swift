//
//  PickerViewController.swift
//  StringHomework
//
//  Created by Daniil Belyaev on 03.08.2021.
//

import UIKit

class PickerViewController: UIViewController {
  
    @IBOutlet weak var myPicker: UIPickerView!
    
    var dataManager = DataManager()
    
    var pickedAnimation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goMoreSettings", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goMoreSettings" else {return}
        guard let destinationVC = segue.destination as? SettingsViewController else {return}
        destinationVC.pickedAnimation.name = pickedAnimation
    }

}


// (их нельзя делать приватными, выдает ошибку)
extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        dataManager.animations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        dataManager.animations[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickedAnimation = dataManager.animations[row].name
        
        print(pickedAnimation)
    }

}
