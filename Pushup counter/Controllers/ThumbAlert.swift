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
        view.backgroundColor = .black
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
    
    
    
    
    
    
    
    func showAlert(title: String, message: String, viewController: UIViewController) {
        
        guard let targetView = viewController.view else {return}
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        UIView.animate(withDuration: 0.4) {
            self.backgroundView.alpha = Constants.backgroundAlpha
        }
        
    }
    
    
}
