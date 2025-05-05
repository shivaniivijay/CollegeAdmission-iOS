//
//  Registration2.swift
//  CollegeAdmission
//
//  Created by Shivani Vijay on 2025-01-28.
//

import UIKit

class RegisterPage2Controller: UIViewController {
    
        
    @IBOutlet weak var course: UITextField!
        
    @IBOutlet weak var campus: UITextField!
        
    @IBOutlet weak var semester: UITextField!
    
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var progressBar: UIProgressView!

    
    var registrationData: RegistrationData?
    var progressValue: Float = 0.5
    override func viewDidLoad() {
           super.viewDidLoad()
           
           emailTextField.isHidden = !emailSwitch.isOn

           progressBar.progress = progressValue
       }
       
    @IBAction func emailSwitchToggled(_ sender: UISwitch) {
           emailTextField.isHidden = !sender.isOn
       }

    @IBAction func onSubmitButtonClicked(_ sender: UIButton) {
        guard let campus = campus.text, !campus.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
               showAlert(message: "Please enter your preferred campus name.")
               return
           }
           guard let courses = course.text, !courses.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
               showAlert(message: "Please enter your course.")
               return
           }
           guard let semester = semester.text, !semester.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
               showAlert(message: "Please enter your semester.")
               return
           }


        // Saves the data
        registrationData?.campus = campus
        registrationData?.courses = courses
        registrationData?.semester = semester
        registrationData?.email = emailTextField.text
        registrationData?.isEmail = emailSwitch.isOn
        
        // Performs segue to Summary Screen
        performSegue(withIdentifier: "goToSummaryPage", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSummaryPage",
           let destinationVC = segue.destination as? SummaryController {
            destinationVC.registrationData = self.registrationData
        }
    }

    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

