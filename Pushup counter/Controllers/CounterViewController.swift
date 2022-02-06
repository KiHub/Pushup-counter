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
    var sets = 3
    var currentSet = 0
    
    var currentNumber = 0
    let date = Date()
    let formatter = DateFormatter()
    var days: [Day] = []
    
    var timer: Timer!
    var timeRemaining = 30
    var setThree = 30
    var chek = 0
    
    let customAlert = ThumbAlert()
    
    @IBOutlet weak var cupImage: UIImageView!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
       chek = 0
        self.tabBarController?.tabBar.isHidden = true
        
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
        thumbImage.isHidden = true
        
        UIDevice.current.isProximityMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
        currentSet = 0
        currentNumber = 0
        
    }
        
    //MARK: - Deactivate proximity sensor
    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.isProximityMonitoringEnabled = false
      //  UIApplication.shared.isIdleTimerDisabled = false
    }
    
    @IBAction func doneBarButton(_ sender: UIBarButtonItem) {
    }
    
    
    //MARK: - Seve data using CoreData
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
    //MARK: - Update counter
    func update() {
        if currentNumber != labelNumber - 1 {
            //  print("labekNumber:\(labelNumber)")
            circularProgressView.angle += Double(360 / labelNumber)
            currentNumber += 1
            label.text = String(currentNumber)
        } else {
            circularProgressView.angle = 360
            //  label.text = "Done!"
            label.text = ""
            cupImage.isHidden = false
            UIDevice.current.isProximityMonitoringEnabled = false
            doneSound.play()
            //            let currentDate = formatter.string(from: date)
            //            print(currentDate)
            //            print("Date:\(date)")
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            let dateString = formatter.string(from: date)
            
            saveDayDate(trainingDate: dateString)
        }
    }

    
    func updateWhile(counеerUP: Int) {
        
        while sets != currentSet {
            circularProgressView.alpha = 1.0
            label.text = "0"
            if currentNumber != labelNumber - 1 {
               // print(currentNumber, ">>>", labelNumber)
              
                circularProgressView.angle += Double(360 / labelNumber)
                currentNumber += 1
                label.text = String(currentNumber)

                print("Part1")
            } else {
                
                circularProgressView.angle = 360
                //  label.text = "Done!"
                label.text = ""
                
                currentSet += 1
                
                thumbUp()
                 //   UIDevice.current.isProximityMonitoringEnabled = false
                    doneSound.play()
                    currentNumber = 0
                  //  circularProgressView.angle += Double(360 / labelNumber)
                    label.text = "0"
                
            }
        }
        
        
        
    }
    
    
    
    func updateWithSetsTwo() {
        

            circularProgressView.alpha = 1.0
            label.text = "0"
            print("Part3")
        if currentNumber < labelNumber - 1 && currentSet != sets {
            print(currentNumber, ">>>", labelNumber)
          
            circularProgressView.angle += Double(360 / labelNumber)
            currentNumber += 1
            label.text = String(currentNumber)

            print("Part1")
        } else { // if currentNumber == labelNumber - 1 && currentSet != sets {
            
            circularProgressView.angle = 360
         
            label.text = ""
            
            currentSet += 1
            
            thumbUp()
            //   UIDevice.current.isProximityMonitoringEnabled = false
                doneSound.play()
                currentNumber = 0
              //  circularProgressView.angle += Double(360 / labelNumber)
                label.text = "0"
            if currentSet == sets {
              //  circularProgressView.alpha = 1.0
              //  circularProgressView.angle = 360
                label.text = ""
                thumbImage.isHidden = true
                cupImage.isHidden = false
                UIDevice.current.isProximityMonitoringEnabled = false

                print("Part4")
            }

    }
  
    }
    
    func updateWithSets() {
        

            circularProgressView.alpha = 1.0
            label.text = "0"
            print("Part3")
        if currentNumber != labelNumber - 1 {
            print(currentNumber, ">>>", labelNumber)
          
            circularProgressView.angle += Double(360 / labelNumber)
            currentNumber += 1
            label.text = String(currentNumber)

            print("Part1")
        } else {
            circularProgressView.angle = 360
            //  label.text = "Done!"
            label.text = ""
            
            currentSet += 1
        //
            
            if currentSet != sets {
            thumbUp()
             //   UIDevice.current.isProximityMonitoringEnabled = false
                doneSound.play()
                currentNumber = 0
              //  circularProgressView.angle += Double(360 / labelNumber)
                label.text = "0"

            } else {
                circularProgressView.alpha = 1.0
                circularProgressView.angle = 360
                label.text = ""
                cupImage.isHidden = false
                UIDevice.current.isProximityMonitoringEnabled = false
                doneSound.play()
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-yyyy"
                let dateString = formatter.string(from: date)
                
                saveDayDate(trainingDate: dateString)
                print("Part4")
                
            }
            
            print("Part2")
        
        }

    }
    
    func rest() {
        UIDevice.current.isProximityMonitoringEnabled = false
        circularProgressView.animate(fromAngle: 360, toAngle: 0, duration: TimeInterval(setThree), completion: nil)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stepOne), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func stepOne() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
  
            timer.invalidate()

        }
        label.text = "\(timeRemaining)"
    }
    
    func thumbUp() {
        

        
      //MARK: - Check here!
   
        thumbImage.isHidden = false
        thumbImage.alpha = 1.0
        circularProgressView.alpha = 1.0
        label.text = ""

        UIView.animate(withDuration: 1.0, delay: 1.0, options: [], animations: {

                    self.thumbImage.alpha = 0.0
                    self.circularProgressView.alpha = 0.0


                }) { (finished: Bool) in

                    self.thumbImage.isHidden = true

                }
        if currentSet == sets {
            cupImage.isHidden = false
          
        }
    }
    
    @objc func stopSensor() {
        UIDevice.current.isProximityMonitoringEnabled = false
        
        
    }
    
    //    perform(#selector(runSensor), with: nil, afterDelay: 4)
    @objc func runSensor() {
        UIDevice.current.isProximityMonitoringEnabled = true
        
        
    }
    
    //MARK: - Proximity sensor
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
               // update()
             
                chek += 1
                print(chek)
                
                updateWithSetsTwo()
              //  updateWithSets()
            }
        }
    }
}

