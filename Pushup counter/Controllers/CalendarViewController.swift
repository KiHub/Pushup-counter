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
 //   var trainigDatesArray = Day()
    var datesWithEvent = ["01-01-2022", "10-01-2022", "05-02-2022", "10-02-2022"]
//    var dateFormatter2: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM-dd-YYYY"
//        return formatter
//    }()
   // var myTraining = ""
    var myTrainings: [String] = []
    
    @IBOutlet weak var calendar: FSCalendar!
    
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
      //  calendar.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func checkedDays() {
        
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let dateString = formatter.string(from: date)
        print("\(dateString)")
    }
    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
//
//    }
//
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//          //  let dateString = self.dateFormatter.string(from: date)
//        if self.days.contains(date) {
//                return days.count // Here, We have to assign JSON count key value based on duplication it will increase dot count UI.
//            }
//            return 0
//        }
    
//    func calendar(calendar: FSCalendar, hasEventForDate date: NSDate) -> Bool {
//        for data in datesWithEvent {
//            let order = NSCalendar.currentCalendar().compareDate(data.eventDate!, toDate: date, toUnitGranularity: .Day)
//            if order == NSComparisonResult.OrderedSame{
//                let unitFlags: NSCalendarUnit = [ .Day, .Month, .Year]
//                let calendar2: NSCalendar = NSCalendar.currentCalendar()
//                let components: NSDateComponents = calendar2.components(unitFlags, fromDate: data.eventDate!)
//                datesWithEvent.append(calendar2.dateFromComponents(components)!)
//            }
//        }
//        return datesWithEvent.contains(date)
//    }
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM-dd-YYYY"
//        let dateString = formatter.string(from: date)
//    //    dateFormatter.locale = Locale.init(identifier: "fa_IR")
//        if let completeDates = trainigDatesArray.trainingDate {
//            for dateString in completeDates {
//                if(formatter.string(from: date) == dateString)
//                {
//                    return 1
//                }
//            }
//            return 0
//        }
//        }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
//        for item in datesWithEvent {
//            guard let excludeddate = formatter.date(from: item) else { return nil }
//            if date.compare(excludeddate) == .orderedSame {
//                return .systemOrange
//            }
//        }
        for item in myTrainings {
            guard let excludeddate = formatter.date(from: item) else { return nil }
            if date.compare(excludeddate) == .orderedSame {
                return .systemOrange
            }
        }
        
        return nil
    }
    
//    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
//
//            let formatter = DateFormatter()
//            formatter.dateFormat = "dd-MM-yyyy"
//            guard let excludeddate = formatter.date(from: "20-01-2022") else { return false }
//            if date.compare(excludeddate) == .orderedSame {
//                return true
//            }
//            return true
//    }
    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        guard let excludeddate = formatter.date(from: "19-01-2022") else { return nil }
//        if date.compare(excludeddate) == .orderedSame {
//            return .red
//        }
//        return nil
//    }
    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        guard let excludeddate = formatter.date(from: "18-01-2022") else { return nil }
//        if date.compare(excludeddate) == .orderedSame {
//            return .red
//        }
//        return nil
//    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        guard let eventDate = formatter.date(from: "02-01-2022") else { return 0 }
        if date.compare(eventDate) == .orderedSame {
            return 1
        }
        
        return 0
    }
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//
//        let dateString = self.dateFormatter2.string(from: date)
//
//        if self.datesWithEvent.contains(dateString) {
//            return 1
//        }
//
//
//
//        return 0
//    }
//
      
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//
//
//
//
//
//        let dateString = self.dateFormatter2.string(from: date)
//
//        if self.datesWithEvent.contains(dateString) {
//            return 1
//        }
//
//
//        return 0
//    }
    
}
