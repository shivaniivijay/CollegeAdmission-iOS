//
//  Feedback.swift
//  CollegeAdmission
//
//  Created by Shivani Vijay on 2025-01-28.
//

import UIKit

class FeedbackController: UIViewController {
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var ratingStepper: UIStepper!
    
    
    @IBOutlet weak var feedbackTextField: UITextField!
    var registrationData: RegistrationData?
    var rating = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingStepper.minimumValue = 1
        ratingStepper.maximumValue = 5
        ratingStepper.value = 1 // Start with a rating of 1
        
        // Update the label
        updateRatingLabel()
        
    }
    
    
    @IBAction func ratingStepperChanged(_ sender: UIStepper) {

        // Update the label with the current value of the stepper
        updateRatingLabel()
    }
    
    func updateRatingLabel() {
        if ratingLabel == nil {
            print("ratingLabel is nil!")
        } else {
            ratingLabel.text = "\(Int(ratingStepper.value))/5"
        }
    }
    
    @IBAction func ratingStepper(_ sender: UIStepper) {
        print("Stepper value: \(sender.value)")
        updateRatingLabel()
    }
    
    @IBAction func onSubmitFeedbackClicked(_ sender: UIButton) {
        guard let feedback = feedbackTextField.text, !feedback.isEmpty else {
            showAlert(message: "Please provide your feedback.")
            return
        }
        
        print("Feedback submitted: \(feedback)")
        
        // Go back to the previous screen
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onSubmitButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Feedback Submitted",
            message: "Thank you for providing us your feedback!.",
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
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
