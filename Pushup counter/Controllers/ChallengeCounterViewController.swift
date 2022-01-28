//
//  ChallengeCounterViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 25.01.2022.
//

import UIKit
import KDCircularProgress



class ChallengeCounterViewController: UIViewController {
    
    var currentNumber = 0
    var currentNumberTwo = 0
    var currentNumberThree = 0
    var labelNumber = 0
    
    var switcher = false
    
    var timer: Timer!
    var timerPlanc: Timer!
    var timeRemaining = 30
    var timeRemainingPlank = 30
    
    
    var currentSet = 0
    var setOne = 0
    var setTwo = 0
    var setThree = 30
    let formatter = DateFormatter()
    let doneSound = SimpleSound(named: "win")
    
    @IBOutlet weak var circularProgressViewCH: KDCircularProgress!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var cupImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var exerciseLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        UIDevice.current.isProximityMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timeRemainingPlank = setThree
        currentSet = setOne
     //   guard let progress = circularProgressViewCH else { return print("ERROR") }
        circularProgressViewCH.startAngle = 270
        circularProgressViewCH.angle = 0
        cupImage.isHidden = true
    //    progress.angle = 0
      //  circularProgressViewCH.startAngle = 270
     //   circularProgressViewCH.angle = 0 ?? 55
        currentNumber = 0
        print(setOne)
        print(setTwo)
        print(setThree)
      //  circularProgressView.startAngle = 270
      //  circularProgressView.angle = 0
        activateProximitySensor()
      
        
       // label.text = String(setOne)
        counterLabel.text = String(currentNumber)
//        counterLabel.text = String(labelNumber)
//
//        cupImage.isHidden = true
//        counterLabel.text = String(currentNumber)
//        counterLabel.layer.shadowColor = #colorLiteral(red: 0.696803987, green: 0.5583711267, blue: 0.908914566, alpha: 1)
//        counterLabel.layer.shadowOpacity = 0.4
//        counterLabel.layer.shadowOffset = .init(width: 3, height: 3)
//        counterLabel.layer.shadowRadius = 2
//        // circularProgressView.angle = Double(labelNumber)
//        circularProgressView.startAngle = 270
//        circularProgressView.angle = 0
//        activateProximitySensor()
//        formatter.dateFormat = "MM-dd-YYYY"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    //    UIDevice.current.isProximityMonitoringEnabled = false
       UIApplication.shared.isIdleTimerDisabled = false
    }
    

    
    func update() {
        
        if currentNumber != currentSet - 1 {
            exerciseLabel.text = "push up"
            //  print("labekNumber:\(labelNumber)")
            print(currentSet)
            circularProgressViewCH.angle += Double(360 / currentSet)
            currentNumber += 1
            counterLabel.text = String(currentNumber)
            
        } else {
          circularProgressViewCH.angle = 0
            exerciseLabel.text = "rest"
         //   counterLabel.text = "Rest"
            doneSound.play()
          //  counterLabel.text = String(currentSet)
            currentNumber = 0
            UIDevice.current.isProximityMonitoringEnabled = false
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
            }
            if currentSet == setTwo {
       //     counterLabel.text = ""
                UIDevice.current.isProximityMonitoringEnabled = false
          //  cupImage.isHidden = false
                plancOption()
                //MARK: - TO DO save data to CD
    //        UIDevice.current.isProximityMonitoringEnabled = false
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
    
    func restAlertFirst() {
        let color = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        let alert = UIAlertController(title: "Rest", message: "Take 30-60 second for rest", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Next set", style: .default)
       
     //   UIDevice.current.isProximityMonitoringEnabled = false
        currentNumber = 0
        currentSet = setTwo
        cancel.setValue(color, forKey: "titleTextColor")
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    func restAlertSecond() {
        let color = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        let alert = UIAlertController(title: "Rest", message: "Take 30-60 second for rest", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Next set", style: .default)
        currentNumber = 0
        currentSet = setThree
        cancel.setValue(color, forKey: "titleTextColor")
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
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
            doneSound.play()
            timer.invalidate()
            timeRemainingPlank = setThree
            exerciseLabel.text = ""
            //MARK: - ToDo Save data and set check mark
        }
        counterLabel.text = "\(timeRemainingPlank)"
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
