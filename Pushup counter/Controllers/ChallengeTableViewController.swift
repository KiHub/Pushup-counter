//
//  ChallengeTableViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 24.01.2022.
//

import UIKit
import CoreData
import FSCalendar

class ChallengeTableViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    var traininDays: [TrainingDay] = [
        TrainingDay(dayNumber: 1, firstSet: 4, secondSet: 2, thirdSet: 10, done: false),
        TrainingDay(dayNumber: 2, firstSet: 6, secondSet: 3, thirdSet: 12, done: false),
        TrainingDay(dayNumber: 3, firstSet: 6, secondSet: 4, thirdSet: 14, done: false),
        TrainingDay(dayNumber: 4, firstSet: 8, secondSet: 4, thirdSet: 16, done: false),
        TrainingDay(dayNumber: 5, firstSet: 10, secondSet: 4, thirdSet: 18, done: false),
        TrainingDay(dayNumber: 6, firstSet: 10, secondSet: 6, thirdSet: 20, done: false),
        TrainingDay(dayNumber: 7, firstSet: 10, secondSet: 7, thirdSet: 20, done: false),
        TrainingDay(dayNumber: 8, firstSet: 12, secondSet: 4, thirdSet: 22, done: false),
        TrainingDay(dayNumber: 9, firstSet: 14, secondSet: 6, thirdSet: 24, done: false),
        TrainingDay(dayNumber: 10, firstSet: 16, secondSet: 6, thirdSet: 26, done: false),
        TrainingDay(dayNumber: 11, firstSet: 16, secondSet: 7, thirdSet: 28, done: false),
        TrainingDay(dayNumber: 12, firstSet: 16, secondSet: 8, thirdSet: 30, done: false),
        TrainingDay(dayNumber: 13, firstSet: 16, secondSet: 10, thirdSet: 30, done: false),
        TrainingDay(dayNumber: 14, firstSet: 18, secondSet: 12, thirdSet: 33, done: false),
        TrainingDay(dayNumber: 15, firstSet: 18, secondSet: 14, thirdSet: 33, done: false),
        TrainingDay(dayNumber: 16, firstSet: 20, secondSet: 10, thirdSet: 35, done: false),
        TrainingDay(dayNumber: 17, firstSet: 22, secondSet: 10, thirdSet: 37, done: false),
        TrainingDay(dayNumber: 18, firstSet: 24, secondSet: 12, thirdSet: 40, done: false),
        TrainingDay(dayNumber: 19, firstSet: 24, secondSet: 14, thirdSet: 42, done: false),
        TrainingDay(dayNumber: 20, firstSet: 26, secondSet: 14, thirdSet: 44, done: false),
        TrainingDay(dayNumber: 21, firstSet: 26, secondSet: 15, thirdSet: 46, done: false),
        TrainingDay(dayNumber: 22, firstSet: 26, secondSet: 15, thirdSet: 48, done: false),
        TrainingDay(dayNumber: 23, firstSet: 26, secondSet: 15, thirdSet: 50, done: false),
        TrainingDay(dayNumber: 24, firstSet: 28, secondSet: 15, thirdSet: 52, done: false),
        TrainingDay(dayNumber: 25, firstSet: 30, secondSet: 15, thirdSet: 55, done: false),
        TrainingDay(dayNumber: 26, firstSet: 35, secondSet: 15, thirdSet: 57, done: false),
        TrainingDay(dayNumber: 27, firstSet: 37, secondSet: 15, thirdSet: 60, done: false),
        TrainingDay(dayNumber: 28, firstSet: 40, secondSet: 15, thirdSet: 40, done: false),
        TrainingDay(dayNumber: 29, firstSet: 45, secondSet: 5, thirdSet: 30, done: false),
        TrainingDay(dayNumber: 30, firstSet: 50, secondSet: 5, thirdSet: 30, done: false)
        
    ]
    
    var fetchedTrainingDaysArray = [DayChallenge]()
    var doneMyTrainings: [String] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        UIApplication.shared.isIdleTimerDisabled = false
        if fetchedTrainingDaysArray.isEmpty {
            for traininDay in traininDays {
                // print(traininDay)
                saveDataToCD(dayNumber: Int64(traininDay.dayNumber), firstSet: Int64(traininDay.firstSet), secondSet: Int64(traininDay.secondSet), thirdSet: Int64(traininDay.thirdSet), done: traininDay.done)
            }
        }
        loadDataFromCD()
        tableView.reloadData()
      //  UIApplication.shared.isIdleTimerDisabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background2.jpg"))
        tableView.register(UINib(nibName: "TrainingDayCell", bundle: nil), forCellReuseIdentifier: "DayCell")
        
    }
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return traininDays.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DayCell"
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier
        ) as? TrainingDayCell ?? TrainingDayCell(style: .value2, reuseIdentifier: cellIdentifier)
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        cell.dayLabel.text = "Day \(fetchedTrainingDaysArray[indexPath.row].dayNumber)"
        cell.pushUpLabel.text = "Push up \(fetchedTrainingDaysArray[indexPath.row].firstSet)-\(fetchedTrainingDaysArray[indexPath.row].secondSet)"
        cell.plankLabel.text = "Full plank \(fetchedTrainingDaysArray[indexPath.row].thirdSet)"
        cell.cellCheck.image = fetchedTrainingDaysArray[indexPath.row].done == true ? UIImage(named: "Check2") : UIImage(named: "Go")
        cell.cellBubble.image = fetchedTrainingDaysArray[indexPath.row].done == true ? UIImage(named: "ButtonDone") : UIImage(named: "ButtonNew")
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        performSegue(withIdentifier: "challengeSegue", sender: tableView)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "challengeSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let challengeCounterVC = segue.destination as! ChallengeCounterViewController
                challengeCounterVC.setOne = Int(fetchedTrainingDaysArray[indexPath.row].firstSet)
                challengeCounterVC.setTwo = Int(fetchedTrainingDaysArray[indexPath.row].secondSet)
                challengeCounterVC.setThree = Int(fetchedTrainingDaysArray[indexPath.row].thirdSet)
                challengeCounterVC.dayNumber = Int(fetchedTrainingDaysArray[indexPath.row].dayNumber)
                challengeCounterVC.row = indexPath.row
            }
        }
    }
    

    func saveData() {
        let context = getContext()
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func savePreloadData() {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "DayChallenge", in: context)
        else {return}
        let daysChallengeObject =  DayChallenge(entity: entity, insertInto: context)
        for trainigDay in traininDays[0...29] {
            daysChallengeObject.dayNumber = Int64(trainigDay.dayNumber)
            daysChallengeObject.firstSet = Int64(trainigDay.firstSet)
            daysChallengeObject.secondSet = Int64(trainigDay.secondSet)
            daysChallengeObject.thirdSet = Int64(trainigDay.thirdSet)
            daysChallengeObject.done = trainigDay.done
            
            do {
                try context.save()
                print("TestArray: \(fetchedTrainingDaysArray)")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    private func saveDataToCD(dayNumber: Int64, firstSet: Int64, secondSet: Int64, thirdSet: Int64, done: Bool) {
        
        let context = getContext()
        //MARK: - Create object
        let entity = NSEntityDescription.entity(forEntityName: "DayChallenge", in: context)
        let newDay = NSManagedObject(entity: entity!, insertInto: context)
        
        //MARK: - Save data to fields
        newDay.setValue(dayNumber, forKey: "dayNumber")
        newDay.setValue(firstSet, forKey: "firstSet")
        newDay.setValue(secondSet, forKey: "secondSet")
        newDay.setValue(thirdSet, forKey: "thirdSet")
        newDay.setValue(done, forKey: "done")
        
        //MARK: - Try save entity
        do {
            try context.save()
        } catch  {
            fatalError ("Error saving data to CD")
        }
    }
    
    func loadDataFromCD() {
        let context = getContext()
        let request : NSFetchRequest<DayChallenge> = DayChallenge.fetchRequest()
        do {
            fetchedTrainingDaysArray = try context.fetch(request)
        } catch {
            print("Error fetching data")
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}

extension ChallengeTableViewController: FSCalendarDelegate, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return nil
    }
    
}

