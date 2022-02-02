//
//  ChallengeTableViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 24.01.2022.
//

import UIKit
import CoreData


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
    
    
//    var trainingDone = [
//        done: false,
//       done: true,
//        done: false,
//      done: false,
//       done: false,
//        done: false,
//      done: false,
//        done: false,
//       done: false,
//       done: false,
//    done: false,
//      done: false,
//  done: false,
//     done: false,
//         done: false,
//        done: false,
//       done: false,
//        done: false,
//     done: false,
//       done: false,
//       done: false,
//        done: false,
//   done: false,
//        done: false,
//    done: false,
//     done: false,
//done: false,
//   done: false,
//        done: false,
//       done: false
//
//    ]
    
    
  //  var doneDays: [DayDone] = []
    var doneMyTrainings: [String] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
        if fetchedTrainingDaysArray.isEmpty {
            for traininDay in traininDays {
               // print(traininDay)
                saveDataToCD(dayNumber: Int64(traininDay.dayNumber), firstSet: Int64(traininDay.firstSet), secondSet: Int64(traininDay.secondSet), thirdSet: Int64(traininDay.thirdSet), done: traininDay.done)
            }
        }
        loadDataFromCD()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        
    //    print("Test array: \(fetchTrainingDaysArray[0].dayNumber)")
    //    print("Test array: \(fetchTrainingDaysArray[0].firstSet)")
        
      //  testArray[0]
        
    //    getDataFromFile()
        
        
//        if fetchedTrainingDaysArray.isEmpty {
//            for traininDay in traininDays {
//               // print(traininDay)
//                saveDataToCD(dayNumber: Int64(traininDay.dayNumber), firstSet: Int64(traininDay.firstSet), secondSet: Int64(traininDay.secondSet), thirdSet: Int64(traininDay.thirdSet), done: traininDay.done)
//            }
//        }
        
//        if defaults.bool(forKey: "First launch") == true {
//            print("Not first launch")
//            defaults.set(true, forKey: "First launch")
//        } else {
//            print("First launch")
//        //    getDataFromFile()
//            for traininDay in traininDays {
//                print(traininDay)
//                saveDataToCD(dayNumber: Int64(traininDay.dayNumber), firstSet: Int64(traininDay.firstSet), secondSet: Int64(traininDay.secondSet), thirdSet: Int64(traininDay.thirdSet), done: traininDay.done)
//            }
//            defaults.set(true, forKey: "First launch")
//        }
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    //   savePreloadData()
        
        
     //   UITabBar.setTransparentTabbar()
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background2.jpg"))
        tableView.register(UINib(nibName: "TrainingDayCell", bundle: nil), forCellReuseIdentifier: "DayCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
 

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return traininDays.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //   let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! TrainingDayCell
        
   //     let cell = UITableViewCell(style: .value2, reuseIdentifier: "DayCell") as! TrainingDayCell
        
        
        let cellIdentifier = "DayCell"
          let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier
          ) as? TrainingDayCell ?? TrainingDayCell(style: .value2, reuseIdentifier: cellIdentifier)

        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        
     //   cell.cellBubble.image = UIImage(named: "ButtonDoneLong")
     //   cell.cellBubble.layer.backgroundColor = CAGradientLayer
        
//        let gradientLayer = CAGradientLayer()
//
//        gradientLayer.colors = [UIColor.red.cgColor,
//                                UIColor.yellow.cgColor,
//                                UIColor.green.cgColor,
//                                UIColor.blue.cgColor]
//        gradientLayer.frame = cell.cellBubble.bounds
//      //  gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
//
//        cell.cellBubble.layer.addSublayer(gradientLayer)
        
   //     cell.dayLabel.text = "Day \(traininDays[indexPath.row].dayNumber): \(traininDays[indexPath.row].firstSet)-\(traininDays[indexPath.row].secondSet)-\(traininDays[indexPath.row].thirdSet)"
        
//        if defaults.bool(forKey: "\(traininDays[indexPath.row].dayNumber)") == true {
//            cell.cellCheck.image = UIImage(named: "Check2")
//        //    cell.cellBubble.image = UIImage(named: "ButtonDone")
//        }
//            print("Not first launch")
//            defaults.set(true, forKey: "First launch")
//        } else {
//            print("First launch")
//        //    getDataFromFile()
//            defaults.set(true, forKey: "First launch")
//        }
        
      //  defaults.set(true, forKey: <#T##String#>)
        
        
        
        if fetchedTrainingDaysArray[indexPath.row].done == true {
            cell.cellBubble.image = UIImage(named: "ButtonDone")
            cell.cellCheck.image = UIImage(named: "Check2")
        }
        
        cell.dayLabel.text = "Day \(fetchedTrainingDaysArray[indexPath.row].dayNumber)"
        cell.pushUpLabel.text = "Push up \(fetchedTrainingDaysArray[indexPath.row].firstSet)-\(fetchedTrainingDaysArray[indexPath.row].secondSet)"
        cell.plankLabel.text = "Full plank \(fetchedTrainingDaysArray[indexPath.row].thirdSet)"

        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
    //    fetchedTrainingDaysArray[row].setValue(true, forKey: "done")
    //    saveData()
     //   tableView.reloadData()
    //    fetchedTrainingDaysArray[indexPath.row].done = true
     //   saveData()
        performSegue(withIdentifier: "challengeSegue", sender: tableView)
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let counterChallengeVC = segue.destination as? ChallengeCounterViewController else {return}
//            counterChallengeVC.labelNumber = 500
//           // traininDays[indexPath.row].firstSet
//        }
        
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
            //    challengeCounterVC.done = fetchTrainingDaysArray[indexPath.row].done
            }
        }
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func saveData() {
        let context = getContext()
        
        do {
            try context.save()
         
        //    print("TestArray: \(fetchedTrainingDaysArray)")
    
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
            
       //     TrainingDay(dayNumber: <#T##Int#>, firstSet: <#T##Int#>, secondSet: <#T##Int#>, thirdSet: <#T##Int#>, done: <#T##Bool#>)
            
            daysChallengeObject.dayNumber = Int64(trainigDay.dayNumber)
            daysChallengeObject.firstSet = Int64(trainigDay.firstSet)
            daysChallengeObject.secondSet = Int64(trainigDay.secondSet)
            daysChallengeObject.thirdSet = Int64(trainigDay.thirdSet)
            daysChallengeObject.done = trainigDay.done
            
         //   dayObject.trainingDate = trainingDate
            do {
                try context.save()
              //  testArray.append(traininDays)
           //     testArray.append(trainigDay)
                print("TestArray: \(fetchedTrainingDaysArray)")
           //     days.append(dayObject)
             //   print("Testing append from core data to array: \(days)")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    private func saveDataToCD(dayNumber: Int64, firstSet: Int64, secondSet: Int64, thirdSet: Int64, done: Bool) {
        // Шаг 1. Получение общего агента и диспетчера управляемых объектов
  //      let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
   //     let managedObectContext = appDelegate.persistentContainer.viewContext
        
        let context = getContext()
        
             // Шаг 2: Создание объекта
        let entity = NSEntityDescription.entity(forEntityName: "DayChallenge", in: context)
        
        let newDay = NSManagedObject(entity: entity!, insertInto: context)
        
             // Шаг 3: Сохраните значение в текстовом поле для человека
        newDay.setValue(dayNumber, forKey: "dayNumber")
        newDay.setValue(firstSet, forKey: "firstSet")
        newDay.setValue(secondSet, forKey: "secondSet")
        newDay.setValue(thirdSet, forKey: "thirdSet")
        newDay.setValue(done, forKey: "done")
        
             // Шаг 4: Сохраните сущность в управляемый объект. Если сохранить не удалось, продолжайте
        do {
            try context.save()
        } catch  {
                     fatalError ("Error saving data to CD")
        }
        
             // Шаг 5: сохранение в массив, обновление пользовательского интерфейса
      //  people.append(person)
    }
    
//    private func saveDataDone(dayNumber: Int64, done: Bool) {
// 
//        
//        let context = getContext()
//        
//   
//        let entity = NSEntityDescription.entity(forEntityName: "DayChallenge", in: context)
//        
//        let newDay = NSManagedObject(entity: entity!, insertInto: context)
//        
//             // Шаг 3: Сохраните значение в текстовом поле для человека
//        newDay.setValue(dayNumber, forKey: "dayNumber")
//        newDay.setValue(firstSet, forKey: "firstSet")
//        newDay.setValue(secondSet, forKey: "secondSet")
//        newDay.setValue(thirdSet, forKey: "thirdSet")
//        newDay.setValue(done, forKey: "done")
//        
//             // Шаг 4: Сохраните сущность в управляемый объект. Если сохранить не удалось, продолжайте
//        do {
//            try context.save()
//        } catch  {
//                     fatalError ("Error saving data to CD")
//        }
        
             // Шаг 5: сохранение в массив, обновление пользовательского интерфейса
      //  people.append(person)
 //   }

    func loadDataFromCD() {
        let context = getContext()
        
        let request : NSFetchRequest<DayChallenge> = DayChallenge.fetchRequest()
        do {
            fetchedTrainingDaysArray = try context.fetch(request)
        } catch {
            print("Error fetching data")
        }
        
    }
    
//    func getDataFromFile() {
//        guard let pathToFile = Bundle.main.path(forResource: "data", ofType: "plist"),
//        let dataArray = NSArray(contentsOfFile: pathToFile) else { return  }
//        print(dataArray)
//        let context = getContext()
//        for dictionary in dataArray {
//         guard let entity = NSEntityDescription.entity(forEntityName: "DayChallenge64", in: context) else {return}
//            let dayOfChallenge = NSManagedObject(entity: entity, insertInto: context) as! DayChallenge64
//            let dayOfChallengeDictionary = dictionary as! [String : AnyObject]
//
//            dayOfChallenge.dayNumber = dayOfChallengeDictionary["dayNumber"] as? Int64 ?? 0
//            dayOfChallenge.firstSet = dayOfChallengeDictionary["firstSet"] as? Int64 ?? 0
//            dayOfChallenge.secondSet = dayOfChallengeDictionary["secondSet"] as? Int64 ?? 0
//            dayOfChallenge.thirdSet = dayOfChallengeDictionary["thirdSet"] as? Int64 ?? 0
//            dayOfChallenge.done = dayOfChallengeDictionary["done"] as? Bool ?? false
//
//        }
//
//    }
//    func saveDoneDate(doneDate: Bool) {
//        let context = getContext()
//        guard let entity = NSEntityDescription.entity(forEntityName: "DayChallenge", in: context)
//        else {return}
//        
//        let daysChallengeObject = DayChallenge(entity: entity, insertInto: context)
//        daysChallengeObject[]
//            .done = doneDate
//
//        do {
//            try context.save()
//        //    days.append(dayObject)
//        //    print("Testing append from core data to array: \(days)")
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//    }
    
    
//    func loadData() {
//
//        let context = getContext()
//        let fetchRequest: NSFetchRequest<DayDone> = DayDone.fetchRequest()
//        do {
//
//      //      doneDays = try context.fetch(fetchRequest)
//      //      doneMyTrainings = doneDays.map { $0.done ?? false }
//       //     print("Fetch array: \(doneMyTrainings)")
//
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//
//    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    


}


