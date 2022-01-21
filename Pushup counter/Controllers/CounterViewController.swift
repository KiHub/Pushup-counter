//
//  CounterViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 19.01.2022.
//

import UIKit
import KDCircularProgress
import CoreData

class CounterViewController: UIViewController {
    
    let doneSound = SimpleSound(named: "win")
    var labelNumber = 55
    var currentNumber = 0
    let date = Date()
    let formatter = DateFormatter()
    var days: [Day] = []
    
    @IBOutlet weak var cupImage: UIImageView!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var label: UILabel!
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let context = getContext()
//        let fetchRequest: NSFetchRequest<Day> = Day.fetchRequest()
//        do {
//            days = try context.fetch(fetchRequest)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cupImage.isHidden = true
        label.text = String(currentNumber)
        label.layer.shadowColor = #colorLiteral(red: 0.696803987, green: 0.5583711267, blue: 0.908914566, alpha: 1)
        label.layer.shadowOpacity = 0.4
        label.layer.shadowOffset = .init(width: 3, height: 3)
        label.layer.shadowRadius = 2
        // circularProgressView.angle = Double(labelNumber)
        circularProgressView.startAngle = 270
        circularProgressView.angle = 0
        activateProximitySensor()
        formatter.dateFormat = "MM-dd-YYYY"
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    @IBAction func doneBarButton(_ sender: UIBarButtonItem) {
        //  animation()
        //        labelNumber += 1
        //        label.text = String(labelNumber)
        //        circularProgressView.angle = Double(labelNumber)
        //    update()
        
    }

    
    func saveDayDate(trainingDate: String) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Day", in: context)
        else {return}
        
        let dayObject = Day(entity: entity, insertInto: context)
        dayObject.trainingDate = trainingDate
        do {
            try context.save()
            days.append(dayObject)
            print("Testing append from core data to array: \(days)")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func update() {
        
        if currentNumber != labelNumber - 1 {
            //  print("labekNumber:\(labelNumber)")
            circularProgressView.angle += Double(360 / labelNumber)
            currentNumber += 1
            label.text = String(currentNumber)
            //  circularProgressView.angle = Double((labelNumber * 100)/360)
            
        } else {
            circularProgressView.angle = 360
            //  label.text = "Done!"
            label.text = ""
            cupImage.isHidden = false
            UIDevice.current.isProximityMonitoringEnabled = false
            doneSound.play()
            let currentDate = formatter.string(from: date)
            print(currentDate)
            print("Date:\(date)")
            
            let formatter = DateFormatter()
                    formatter.dateFormat = "dd-MM-yyyy"
                    let dateString = formatter.string(from: date)
            
            saveDayDate(trainingDate: dateString)
        }
    }
    //MARK: - Proximity sensor activate
    func activateProximitySensor() {
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        if device.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(self, selector: #selector(proximityChanged(notification:)), name: UIDevice.proximityStateDidChangeNotification, object: device)
        }
    }
    
    @objc func proximityChanged(notification: NSNotification) {
        if let device = notification.object as? UIDevice {
            if device.proximityState {
                
                update()
            }
        }
    }
}
