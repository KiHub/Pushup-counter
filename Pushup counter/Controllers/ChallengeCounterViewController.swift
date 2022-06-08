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
    
    var fetchedTrainingDaysArray = [DayChallenge]()
    var currentNumber = 0
    var quit = false
    var timer: Timer!
    var timerPlanc: Timer!
    var timeRemaining = 30
    var timeRemainingTwo = 30
    var timeRemainingPlank = 30
    let date = Date()
    var days: [Day] = []
    var dayNumber = 0
    var currentSet = 0
    var setOne = 0
    var setTwo = 0
    var setThree = 30
    var row = 0
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
        quit = false
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.2"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(ChallengeCounterViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
        exerciseLabel.alpha = 0.7
        timeRemainingPlank = setThree
        timeRemainingTwo = setThree
        timeRemaining = setThree
        currentSet = setOne
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
        activateProximitySensor()
        
        print("Hey,\(fetchedTrainingDaysArray)")
        loadDataFromCD()
        print("Hey,\(fetchedTrainingDaysArray)")
        print("555: \(fetchedTrainingDaysArray[dayNumber - 1].dayNumber)")
        
        counterLabel.text = String(currentNumber)
        
    
   
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
        UIDevice.current.isProximityMonitoringEnabled = false
        reset()
    }
    
    @objc func back(sender: UIBarButtonItem) {
        quit = true
        _ = navigationController?.popViewController(animated: true)
    }
    
    func updateTwo() {
        print("start")
       
        
        if quit == true {return}
        switch currentNumber < currentSet - 1 {
        case true:
            print("case 1 start")
            exerciseLabel.text = "push up"
            print(currentSet)
            circularProgressViewCH.angle += Double(360 / currentSet)
            currentNumber += 1
            counterLabel.text = String(currentNumber)
            print("case 1 exit", currentNumber, currentSet)
            
        case (false) where currentSet != setTwo:
            print("case 2 start")
            delay(setThree) {
                [self] in
                    UIDevice.current.isProximityMonitoringEnabled = true
                    circularProgressViewCH.angle = 0
                    exerciseLabel.text = "push up"
                    currentSet = setTwo
                    print("after block")
         
                
            }
            UIDevice.current.isProximityMonitoringEnabled = false
            thumbUp()
            exerciseLabel.text = "rest"
            doneSound.play()
            currentNumber = 0
            circularProgressViewCH.animate(fromAngle: 360, toAngle: 0, duration: TimeInterval(setThree), completion: nil)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stepOne), userInfo: nil, repeats: true)
//            afterBlock(seconds: setThree + 1, queue: .main) { [self] in
//                UIDevice.current.isProximityMonitoringEnabled = true
//                circularProgressViewCH.angle = 0
//                counterLabel.text = "0"
//                exerciseLabel.text = "push up"
//                currentSet = setTwo
//                print("after block")
//            }
            
            print("case 2 exit", currentNumber, currentSet)

            
        case (false) where currentSet == setTwo:
            
            print("case 3 start")
            UIDevice.current.isProximityMonitoringEnabled = false
            thumbUp()
            exerciseLabel.text = "rest"
            doneSound.play()
            currentNumber = 0
            if   exerciseLabel.text == "rest" {
                UIDevice.current.isProximityMonitoringEnabled = false
            }
            circularProgressViewCH.isHidden = false
            circularProgressViewCH.animate(fromAngle: 360, toAngle: 0, duration: TimeInterval(setThree), completion: nil)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stepTwo), userInfo: nil, repeats: true)
            perform(#selector(runSensorPlanc), with: nil, afterDelay: TimeInterval(setThree + 1))
            print("case 3 exit", currentNumber, currentSet)
        default:
            print("return")
            return
        }
    }
    
    func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global(),
                    completion: @escaping () -> ()) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            completion()
        }
    }
    
    func readyAlert() {
        let color = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        let alert = UIAlertController(title: "Ready?", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "YES", style: .default) { (action) in
            UIDevice.current.isProximityMonitoringEnabled = true
        }
        
        cancel.setValue(color, forKey: "titleTextColor")
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @objc func runSensor() {
        
        
        UIDevice.current.isProximityMonitoringEnabled = true
        circularProgressViewCH.angle = 0
        counterLabel.text = "0"
        exerciseLabel.text = "push up"
    }
    
    @objc func runSensorPlanc() {
        
        timeRemainingPlank = setThree
        circularProgressViewCH.angle = 0
        exerciseLabel.text = "full plank"
        circularProgressViewCH.animate(fromAngle: 0, toAngle: 360, duration: TimeInterval(setThree), completion: nil)
        timerPlanc = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    func plancOption() {
        UIDevice.current.isProximityMonitoringEnabled = false
        exerciseLabel.text = "rest"
        timeRemaining = setThree
        circularProgressViewCH.animate(fromAngle: 360, toAngle: 0, duration: TimeInterval(setThree), completion: nil)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stepTwo), userInfo: nil, repeats: true)
        reset()
    }
    
    func thumbUp() {
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
        timeRemainingTwo = setThree
        currentSet = setOne
        currentNumber = 0
        circularProgressViewCH.angle = 0
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
            timer.invalidate()
        }
        counterLabel.text = "\(timeRemaining)"
    }
    
    @objc func stepTwo() {
        if timeRemainingTwo > 0 {
            timeRemainingTwo -= 1
        } else {
            timer.invalidate()
        }
        counterLabel.text = "\(timeRemainingTwo)"
    }
    
    @objc func step() {
        if timeRemainingPlank > 0 {
            timeRemainingPlank -= 1
        } else {
            cupImage.isHidden = false
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            let dateString = formatter.string(from: date)
            print(dateString)
            saveDayDate(trainingDate: dateString)
            fetchedTrainingDaysArray[dayNumber - 1].done = true
            save()
            doneSound.play()
            timerPlanc.invalidate()
            timeRemainingPlank = setThree
            exerciseLabel.text = ""
            
            //MARK: - ToDo Update done property in core data
            
            reset()
            
            UIDevice.current.isProximityMonitoringEnabled = false
            UIApplication.shared.isIdleTimerDisabled = false
            
            //MARK: - ToDo Save data and set check mark
        }
        counterLabel.text = "\(timeRemainingPlank)"
    }
    
    func save() {
        let context = getContext()
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
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
                print("sensor active")
                updateTwo()
            }
        }
    }
}
