//
//  CounterViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 19.01.2022.
//

import UIKit

class CounterViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var timer = Timer()
    
    var labelNumber = 55
    
    @IBOutlet weak var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String(labelNumber)
        
        
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100,
                                        startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = #colorLiteral(red: 0.9960784314, green: 0.7607843137, blue: 0.3764705882, alpha: 0.8470588235)
        trackLayer.lineWidth = 20
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
       
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        view.layer.addSublayer(shapeLayer)
        
        activateProximitySensor()
       
    }
    
    @IBAction func doneBarButton(_ sender: UIBarButtonItem) {
        animation()
      //  label.text = String(labelNumber - 1)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func animation() {
      
        
       
        //    timerWork = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
       
        
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
          //  basicAnimation.fromValue = 0
            basicAnimation.toValue = 1
            basicAnimation.duration = CFTimeInterval(labelNumber)
            basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            basicAnimation.isRemovedOnCompletion = false
            shapeLayer.add(basicAnimation, forKey: "urSoBasic")
     
        
//        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//
//        basicAnimation.toValue = 1
//        basicAnimation.duration = CFTimeInterval(labelNumber)
//        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
//        basicAnimation.isRemovedOnCompletion = false
//        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
 
        
        
    }
    
    func proximityChanged(notification: NSNotification) {
      if let device = notification.object as? UIDevice {
        print ("\(device) detected!")
        label.text = String(labelNumber - 1 )
      }
    }
            
    func activateProximitySensor() {
      let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        if device.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(self, selector: Selector(("proximityChanged:")), name: NSNotification.Name(rawValue: "UIDeviceProximityStateDidChangeNotification"), object: device)
        }
      }
    

}
