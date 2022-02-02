//
//  ChallengeCounterViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 25.01.2022.
//

import UIKit
import KDCircularProgress
import CoreData



class ChallengeCounterViewController: UIViewController {
    
  //  let defaults = UserDefaults.standard
    var fetchedTrainingDaysArray = [DayChallenge]()
    
    var currentNumber = 0
    var currentNumberTwo = 0
    var currentNumberThree = 0
    var labelNumber = 0
    
    var switcher = false
    
    var timer: Timer!
    var timerPlanc: Timer!
    var timeRemaining = 30
    var timeRemainingPlank = 30
    
    var dayNumber = 0
    var currentSet = 0
    var setOne = 0
    var setTwo = 0
    var setThree = 30
    var row = 0
  //  var done = false
    
 //   var fetchedTrainingDaysArray = [DayChallenge]()
  //  var indexPath = 0
    
    let formatter = DateFormatter()
    let doneSound = SimpleSound(named: "win")
    
    @IBOutlet weak var circularProgressViewCH: KDCircularProgress!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var cupImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIDevice.current.isProximityMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
        reset()
        currentSet = setOne
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseLabel.alpha = 0.7
        timeRemainingPlank = setThree
      //  currentSet = setOne
     //   guard let progress = circularProgressViewCH else { return print("ERROR") }
        circularProgressViewCH.startAngle = 270
        circularProgressViewCH.angle = 0
        cupImage.isHidden = true
        thumbImage.isHidden = true
        
        counterLabel.layer.shadowColor = #colorLiteral(red: 0.696803987, green: 0.5583711267, blue: 0.908914566, alpha: 1)
        counterLabel.layer.shadowOpacity = 0.4
        counterLabel.layer.shadowOffset = .init(width: 3, height: 3)
        counterLabel.layer.shadowRadius = 2

        currentNumber = 0
        print(setOne)
        print(setTwo)
        print(setThree)
      //  circularProgressView.startAngle = 270
      //  circularProgressView.angle = 0
        activateProximitySensor()

        counterLabel.text = String(currentNumber)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
    //    UIDevice.current.isProximityMonitoringEnabled = false
       UIApplication.shared.isIdleTimerDisabled = false
        UIDevice.current.isProximityMonitoringEnabled = false
        reset()
    }
    

    
    func update() {
        
//        exerciseLabel.text == "rest" ? (UIDevice.current.isProximityMonitoringEnabled = false) : (UIDevice.current.isProximityMonitoringEnabled = true)
        
        if currentNumber != currentSet - 1 {
            exerciseLabel.text = "push up"
            //  print("labekNumber:\(labelNumber)")
            print(currentSet)
            circularProgressViewCH.angle += Double(360 / currentSet)
            currentNumber += 1
            counterLabel.text = String(currentNumber)
            print("CurrentNumber\(currentNumber)")
            print("currentSet\(currentSet)")
        } else {
          circularProgressViewCH.angle = 0
            thumbUp()
            exerciseLabel.text = "rest"
         //   counterLabel.text = "Rest"
            doneSound.play()
         //   thumbImage.isHidden = false
          //  counterLabel.text = String(currentSet)
            currentNumber = 0
            if   exerciseLabel.text == "rest" {
            UIDevice.current.isProximityMonitoringEnabled = false
            }
            //MARK: - ToDo Rest Timer
            
            if currentSet != setTwo {
                timeRemaining = setThree
              
                exerciseLabel.text = "rest"
                circularProgressViewCH.animate(fromAngle: 360, toAngle: 0, duration: TimeInterval(setThree), completion: nil)
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stepOne), userInfo: nil, repeats: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(setThree)) {
               UIDevice.current.isProximityMonitoringEnabled = true
                self.circularProgressViewCH.angle = 0
                self.counterLabel.text = "0"
                self.exerciseLabel.text = "push up"
            }
            } else {

                plancOption()

                //MARK: - TO DO save data to CD

            }
            currentSet = setTwo
         
        }
    }
    func plancOption() {
        exerciseLabel.text = "rest"
        timeRemaining = setThree
        
      //  counterLabel.text = "Rest"
        circularProgressViewCH.animate(fromAngle: 360, toAngle: 0, duration: TimeInterval(setThree), completion: nil)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stepOne), userInfo: nil, repeats: true)
        
     
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(setThree)) { [self] in
          //  UIDevice.current.isProximityMonitoringEnabled = true
            timeRemainingPlank = setThree
            circularProgressViewCH.angle = 0
            exerciseLabel.text = "full plank"
          //  timeRemaining = setThree
         //   self.label.text = "0"
            circularProgressViewCH.animate(fromAngle: 0, toAngle: 360, duration: TimeInterval(setThree), completion: nil)
            timerPlanc = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        }
        
        
        
    }
    
    func thumbUp() {
        
   //     fetchedTrainingDaysArray[row].done.setValue(true, forKey: "done")
        
    //    saveData()
        
        thumbImage.isHidden = false
        thumbImage.alpha = 1.0
        counterLabel.isHidden = true

        UIView.animate(withDuration: 0.5, delay: 1.0, options: [], animations: {

                    self.thumbImage.alpha = 0.0

                }) { (finished: Bool) in

                    self.thumbImage.isHidden = true
                    self.counterLabel.isHidden = false
                }
    }
    
    func reset() {
        timeRemainingPlank = setThree
        timeRemaining = setThree
        currentSet = setOne
        currentNumber = 0
        circularProgressViewCH.angle = 0
  //      UIDevice.current.isProximityMonitoringEnabled = false
        if timer != nil {
            timer.invalidate()
        }
        
        if timerPlanc != nil {
            timerPlanc.invalidate()
        }
        
        
    }
    

    @objc func stepOne() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
          //  cupImage.isHidden = false
          //  doneSound.play()
            timer.invalidate()
        //    timeRemaining = setThree
          //  exerciseLabel.text = ""
            //MARK: - ToDo Save data and set check mark
        }
        counterLabel.text = "\(timeRemaining)"
    }
    
    @objc func step() {
        if timeRemainingPlank > 0 {
            timeRemainingPlank -= 1
        } else {
            cupImage.isHidden = false
            

            //MARK: - TO DO add save func
            
            doneSound.play()
            timerPlanc.invalidate()
            timeRemainingPlank = setThree
            exerciseLabel.text = ""
            
            
            //MARK: - ToDo Update done property in core data
       
           
         //   saveDoneStatus()
         //   defaults.set(true, forKey: "\(dayNumber)")
            
            reset()
         //   currentSet = setOne
            
            UIDevice.current.isProximityMonitoringEnabled = false
            UIApplication.shared.isIdleTimerDisabled = false
            
            //MARK: - ToDo Save data and set check mark
        }
        counterLabel.text = "\(timeRemainingPlank)"
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
                update()
               // updateUI()
            }
        }
    }
}
