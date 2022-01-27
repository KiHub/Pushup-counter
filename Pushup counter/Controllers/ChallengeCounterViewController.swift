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
    
    var currentSet = 0
    var setOne = 0
    var setTwo = 0
    var setThree = 0
    let formatter = DateFormatter()
    let doneSound = SimpleSound(named: "win")
    
    @IBOutlet weak var circularProgressViewCH: KDCircularProgress!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var cupImage: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        UIDevice.current.isProximityMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
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
        label.text = String(currentNumber)
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
        UIDevice.current.isProximityMonitoringEnabled = false
      //  UIApplication.shared.isIdleTimerDisabled = false
    }
    
//    func updateUI() {
//        
//        for set in setOne, setTwo, setThree {
//            if currentNumber != set - 1 {
//                
//                circularProgressViewCH.angle += Double(360 / set)
//                currentNumber += 1
//               
//                label.text = String(currentNumber)
//            } else {
//                label.text = "Done!"
//                doneSound.play()
//                currentNumber = 0
//                circularProgressViewCH.angle = 0
//            }
//        }
//        
//    }
    
//    func update2() {
//        if currentNumber != currentSet - 1 {
//            //  print("labekNumber:\(labelNumber)")
//            circularProgressViewCH.angle += Double(360 / currentSet)
//            currentNumber += 1
//            label.text = String(currentNumber)
//            switcher = true
//        } else if switcher == true {
//            circularProgressViewCH.angle = 0
//
//            currentSet = setTwo
//            doneSound.play()
//         //   currentSet = setTwo
//            currentNumber = 0
//
//        }
//
//
//        else {
//          circularProgressViewCH.angle = 0
//            //  label.text = "Done!"
//
//            //MARK: - ToDo Rest Timer
//
//            if currentSet == setTwo {
//                label.text = ""
//                cupImage.isHidden = false
//                UIDevice.current.isProximityMonitoringEnabled = false
//            }
//        //    label.text = "\(currentSet)"
//          //  cupImage.isHidden = false
//         //   UIDevice.current.isProximityMonitoringEnabled = false
//            currentSet = setTwo
//            doneSound.play()
//         //   currentSet = setTwo
//            currentNumber = 0
//        }
//    }
    
    func update() {
       
        if currentNumber != currentSet - 1 {
            //  print("labekNumber:\(labelNumber)")
            print(currentSet)
            circularProgressViewCH.angle += Double(360 / currentSet)
            currentNumber += 1
            label.text = String(currentNumber)
            
        } else
        
        
        {
          circularProgressViewCH.angle = 0
             label.text = "Rest"
            
            doneSound.play()
            currentNumber = 0
            UIDevice.current.isProximityMonitoringEnabled = false
            //MARK: - ToDo Rest Timer
            
            
            
            if currentSet != setTwo {
                circularProgressViewCH.animate(fromAngle: 360, toAngle: 0, duration: 30, completion: nil)
           //     circularProgressViewCH.animate(toAngle: 360, duration: 30, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 30.00) {
                UIDevice.current.isProximityMonitoringEnabled = true
                self.circularProgressViewCH.angle = 0
            }
            }
            if currentSet == setTwo {
            label.text = ""
            cupImage.isHidden = false
            UIDevice.current.isProximityMonitoringEnabled = false
            
            }
            currentSet = setTwo
          //  circularProgressViewCH.angle = 0
           
            //    label.text = "\(currentSet)"
              //  cupImage.isHidden = false
             //   UIDevice.current.isProximityMonitoringEnabled = false
         //   currentNumber = 0
         //   restAlertFirst()
            //MARK: - TO DO Rest Alert
            
            //            let currentDate = formatter.string(from: date)
            //            print(currentDate)
            //            print("Date:\(date)")
            
       //     let formatter = DateFormatter()
     //       formatter.dateFormat = "dd-MM-yyyy"
      //      let dateString = formatter.string(from: date)
            
       //     saveDayDate(trainingDate: dateString)
//
//            if currentNumberTwo != setTwo - 1 {
//
//                circularProgressViewCH.angle += Double(360 / setTwo)
//                currentNumberTwo += 1
//                label.text = String(currentNumberTwo)
//            } else {
//                circularProgressViewCH.angle = 0
//                    label.text = "Done!"
//                currentNumberTwo = 0
//                //  label.text = ""
//                  cupImage.isHidden = false
//              //    UIDevice.current.isProximityMonitoringEnabled = false
//                  doneSound.play()
//          //      currentSet = setThree
//       //         restAlertSecond()
//         //         currentNumber = 0
//
////                if currentNumber != currentSet - 1 {
////                    circularProgressViewCH.angle += Double(360 / currentSet)
////                    currentNumber += 1
////                    label.text = String(currentNumber)
////                } else {
////                    circularProgressViewCH.angle = 360
////                    label.text = "Done!"
////                    currentNumber = 0
////                    //  label.text = ""
////                      cupImage.isHidden = false
////                      UIDevice.current.isProximityMonitoringEnabled = false
////                      doneSound.play()
////                      currentNumber = 0
////
////
////                }
//
//            }
            
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
