//
//  CalendarViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 21.01.2022.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        // Do any additional setup after loading the view.
    }
    

}

extension CalendarViewController: FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-YYYY"
        let dateString = formatter.string(from: date)
        print("\(dateString)")
    }
    
}
