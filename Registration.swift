//
//  Registration.swift
//  CollegeAdmission
//
//  Created by Shivani Vijay on 2025-01-28.
//

import UIKit

class RegisterController: UIViewController {

    
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var highSchoolTextField: UITextField!
    @IBOutlet weak var gradeSlider: UISlider!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var registrationData: RegistrationData?
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Initializes registrationData as an instance of RegistrationData
            registrationData = RegistrationData(name: "",
                                               age: "",
                                               highSchool: "",
                                               grade: 0,
                                               isEmail: false)
            
            // Set initial values for UI elements
            gradeSlider.minimumValue = 0.0  // minimum value
            gradeSlider.maximumValue = 100.0  // maximum value
            gradeSlider.value = 0.0
            gradeLabel.text = "0"
        progressBar.progress = 0.25
        }
    
    @IBAction func gradeSliderChanged(_ sender: UISlider) {
        // Gets the integer value of the slider
        let value = Int(sender.value)

        // Updates the label with the current slider value
        gradeLabel.text = "\(value)"
    }


    @IBAction func onContinueButtonClicked(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(message: "Please enter your name.")
            return
        }
        guard let age = ageTextField.text, !age.isEmpty else {
            showAlert(message: "Please enter your age.")
            return
        }
        guard let highSchool = highSchoolTextField.text, !highSchool.isEmpty else {
            showAlert(message: "Please enter your high school name.")
            return
        }

        // Sets the data in the registrationData object
        registrationData?.name = name
        registrationData?.age = age
        registrationData?.highSchool = highSchool
        registrationData?.grade = Int(gradeSlider.value)
        
        performSegue(withIdentifier: "goToRegistrationPage2", sender: self)


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRegistrationPage2",
           let destinationVC = segue.destination as? RegisterPage2Controller {
            destinationVC.registrationData = self.registrationData
            destinationVC.progressValue = 0.5  
        }
    }

    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
