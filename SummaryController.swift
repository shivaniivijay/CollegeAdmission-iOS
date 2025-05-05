//
//  SummaryController.swift
//  CollegeAdmission
//
//  Created by Shivani Vijay on 2025-01-28.
//

import UIKit

class SummaryController: UIViewController {
    
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var highSchoolLabel: UILabel!
    @IBOutlet weak var campusLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var semesterLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!

    var registrationData: RegistrationData?
    var progressValue: Float = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Populates labels with data from RegistrationData
        nameLabel.text = registrationData?.name
           ageLabel.text = registrationData?.age
           highSchoolLabel.text = registrationData?.highSchool
           gradeLabel.text = "\(registrationData?.grade ?? 0)"
           campusLabel.text = registrationData?.campus
           courseLabel.text = registrationData?.courses
           semesterLabel.text = registrationData?.semester
           emailLabel.text = registrationData?.isEmail == true ? registrationData?.email : "Not provided"
    }
    
    @IBAction func onSubmitButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Application Submitted",
            message: "Your application has been successfully submitted.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigateToHome()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToHome() {
        if let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomePageController") {
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true, completion: nil)
        }
    }
}
