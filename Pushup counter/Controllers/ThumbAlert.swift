//
//  ThumbAlert.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 04.02.2022.
//

import UIKit

class ThumbAlert {
    
    struct Constants {
        static let backgroundAlpha: CGFloat = 0.8
    }
    
    
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.alpha = 0
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "Thumb")
        
        return imageView
        
    }()
    
    
    
    
  //  func showAlert(title: String, message: String, viewController: UIViewController) {
    
    
    func showAlert(viewController: CounterViewController) {
        
        guard let targetView = viewController.view else {return}
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 40, y: -300, width: 300, height: 300)
        
        backgroundView.frame = CGRect(x: 0, y: 0, width: alertView.frame.width, height: alertView.frame.height)
        alertView.addSubview(backgroundImage)
        
        
        let buttonAlert = UIButton(frame: CGRect(x: 40, y: -300, width: 300, height: 300))
        buttonAlert.addTarget(self, action: #selector(dismissAlert), for: UIControl.Event.touchUpInside)
        alertView.addSubview(buttonAlert)
        
        
        UIView.animate(withDuration: 0.4, animations: {
            self.backgroundView.alpha = Constants.backgroundAlpha
        }) { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = targetView.center
                }
            }
        }
        
    }
    
    @objc func dismissAlert() {
        
    }
    
}
