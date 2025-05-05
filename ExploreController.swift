//
//  ExploreViewController.swift
//  CollegeAdmission
//
//  Created by Shivani Vijay on 2025-01-27.
//

import UIKit

class ExploreController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var coursesTableView: UITableView!
    // Data to show in the table view
    var courses: [String] = [
        "Computer Programming (CPP)",
        "Artificial Intelligence (AIG)",
        "Cloud Architecture & Administration (CAA)",
        "Cybersecurity & Threat Management (CYT)"
    ]
    
    var tuitionCosts: [String: Int] = [
        "Computer Programming (CPP)": 12000,
        "Artificial Intelligence (AIG)": 15000,
        "Cloud Architecture & Administration (CAA)": 13000,
        "Cybersecurity & Threat Management (CYT)": 14000
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view data source
        coursesTableView.dataSource = self
        coursesTableView.delegate = self
    }
    
    // Table View Data Source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath)
        let course = courses[indexPath.row]
        if let tuition = tuitionCosts[course] {
            cell.textLabel?.text = "\(course) - Tuition: $\(tuition)"
        }
        return cell
    }
}
