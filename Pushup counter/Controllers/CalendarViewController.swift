//
//  CalendarViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 21.01.2022.
//

import UIKit
import FSCalendar
import CoreData

class CalendarViewController: UIViewController {
    
    var days: [Day] = []
    var myTrainings: [String] = []
    
    @IBOutlet weak var calendar: FSCalendar!
    //MARK: - Fetch data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = getContext()
        let fetchRequest: NSFetchRequest<Day> = Day.fetchRequest()
        do {
            
            days = try context.fetch(fetchRequest)
            myTrainings = days.map { $0.trainingDate ?? "01-01-2022" }
            print("Fetch array: \(myTrainings)")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
//MARK: - Calendar delegate
extension CalendarViewController: FSCalendarDelegate, FSCalendarDelegateAppearance {
    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        let dateString = formatter.string(from: date)
//        print("\(dateString)")
//    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        for item in myTrainings {
            guard let excludeddate = formatter.date(from: item) else { return nil }
            if date.compare(excludeddate) == .orderedSame {
                return .systemOrange
            }
        }
        return nil
    }
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        guard let eventDate = formatter.date(from: "02-01-2022") else { return 0 }
//        if date.compare(eventDate) == .orderedSame {
//            return 1
//        }
//        return 0
//    }
    
}
