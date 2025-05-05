//
//  Welcome.swift
//  CollegeAdmission
//
//  Created by Shivani Vijay on 2025-01-28.
//

import UIKit

class WelcomeController: UIViewController {
    
    
    @IBOutlet weak var getStart: UIButton!
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    
    @IBOutlet weak var collegeImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the default image for Seneca College
        collegeImageView.image = UIImage(named: "seneca.jpg")
        setupDefaultTheme()
    }
    
    @IBAction func segmentedControlChange(_ sender: UISegmentedControl) {
        if segmentedController.selectedSegmentIndex == 0 {
            // Light Theme
            view.backgroundColor = UIColor.systemBackground
            welcomeLabel.textColor = UIColor.label
        } else if segmentedController.selectedSegmentIndex == 1 {
            // Dark Theme
            view.backgroundColor = UIColor.black
            welcomeLabel.textColor = UIColor.white
        }
    }
    
    private func setupDefaultTheme() {
        // Set default theme to Light Mode
        view.backgroundColor = UIColor.systemBackground
        welcomeLabel.textColor = UIColor.label
    }
}
