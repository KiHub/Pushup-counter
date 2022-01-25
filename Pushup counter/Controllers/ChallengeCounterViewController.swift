//
//  ChallengeCounterViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 25.01.2022.
//

import UIKit
import KDCircularProgress



class ChallengeCounterViewController: UIViewController {
    
    var labelNumber = 0
    var currentNumber = 0
    let formatter = DateFormatter()
    let doneSound = SimpleSound(named: "win")
    
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var cupImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(labelNumber)
        
        cupImage.isHidden = true
        counterLabel.text = String(currentNumber)
        counterLabel.layer.shadowColor = #colorLiteral(red: 0.696803987, green: 0.5583711267, blue: 0.908914566, alpha: 1)
        counterLabel.layer.shadowOpacity = 0.4
        counterLabel.layer.shadowOffset = .init(width: 3, height: 3)
        counterLabel.layer.shadowRadius = 2
        // circularProgressView.angle = Double(labelNumber)
        circularProgressView.startAngle = 270
        circularProgressView.angle = 0
        activateProximitySensor()
        formatter.dateFormat = "MM-dd-YYYY"

        // Do any additional setup after loading the view.
    }
    

    func update() {
        if currentNumber != labelNumber - 1 {
            //  print("labekNumber:\(labelNumber)")
            circularProgressView.angle += Double(360 / labelNumber)
            currentNumber += 1
            counterLabel.text = String(currentNumber)
        } else {
            circularProgressView.angle = 360
            //  label.text = "Done!"
            counterLabel.text = ""
         //   cupImage.isHidden = false
            UIDevice.current.isProximityMonitoringEnabled = false
            doneSound.play()
            //            let currentDate = formatter.string(from: date)
            //            print(currentDate)
            //            print("Date:\(date)")
            
       //     let formatter = DateFormatter()
     //       formatter.dateFormat = "dd-MM-yyyy"
      //      let dateString = formatter.string(from: date)
            
       //     saveDayDate(trainingDate: dateString)
        }
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
            }
        }
    }
}
