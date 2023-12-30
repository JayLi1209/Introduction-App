//
//  ViewController.swift
//  IntroductionApp
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    @IBOutlet weak var friendSlider: UISlider!
    @IBOutlet weak var friendCounter: UILabel!
    
    @IBAction func sliderDidChange(_ sender: UISlider) {
        friendCounter.text = "\(Int(sender.value))"
    }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        // Chooses the title we selected in segmented control.
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year of school and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets. I have \(friendCounter.text!) friends."
        
        // create that alert.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // the section after the alert.
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // add the action using controller.
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        // Save the data when we're done editing
        UserDefaults.standard.set(firstNameTextField.text, forKey: "firstNameValue")
        UserDefaults.standard.set(lastNameTextField.text, forKey: "lastNameValue")
        UserDefaults.standard.set(schoolNameTextField.text, forKey: "schoolNameValue")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        friendSlider.minimumValue = 0
        friendSlider.maximumValue = 100
        
        // Load the saved data
        firstNameTextField.text = UserDefaults.standard.string(forKey: "firstNameValue") ?? "Jay"
        lastNameTextField.text = UserDefaults.standard.string(forKey: "lastNameValue") ?? "Li"
        schoolNameTextField.text = UserDefaults.standard.string(forKey: "schoolNameValue") ?? "Vandy"
    }


}

