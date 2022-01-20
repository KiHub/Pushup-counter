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
        trackLayer.strokeColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
       
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.6520697474, green: 0.7128807902, blue: 0.7406589985, alpha: 0.8470588235)
        shapeLayer.lineWidth = 20
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        view.layer.addSublayer(shapeLayer)
        
        
       
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
            basicAnimation.toValue = 1
            basicAnimation.duration = CFTimeInterval(labelNumber)
            basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            basicAnimation.isRemovedOnCompletion = false
            shapeLayer.add(basicAnimation, forKey: "urSoBasic")
     
        
    }

}
