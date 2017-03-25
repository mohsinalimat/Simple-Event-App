//
//  FSCalendarViewController.swift
//  Event App
//
//  Created by Dustin Allen on 3/25/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import Foundation

class FSCalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate weak var calendar: FSCalendar!
    @IBOutlet var dateFieldArea: UITextField!
    @IBOutlet var calenderView: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Border Radius at 20 provides Rounded Look
        dateFieldArea.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        dateFieldArea.layer.cornerRadius = 20
        dateFieldArea.layer.borderWidth = 0.5
        dateFieldArea.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calendarButton(_ sender: Any) {
        
    }
}
