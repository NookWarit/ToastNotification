//
//  ToastNotification.swift
//  ToastNotification
//
//  Created by Foodstory on 10/5/2564 BE.
//

import UIKit

public extension UIViewController {
    func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}

extension UIView {
    
    public func fadeIn(withDuration duration: TimeInterval = 1.0,
                withHandler handler: (() -> Void)? = nil) {
        
        let defaultAlpha = self.alpha
        self.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            self.alpha = defaultAlpha
        }, completion: { (success) in
            guard let handler = handler else { return }
            handler()
        })
    }
    
    public func fadeOut(withDuration duration: TimeInterval = 1.0,
                 withHandler handler: (() -> Void)? = nil) {
        
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: { (success) in
            guard let handler = handler else { return }
            handler()
        })
    }
    
    public func fadeAnimation(duration: TimeInterval = 0.5,
                       animation: @escaping (() -> Void),
                       completetion: ((Bool) -> Void)? = nil) {
        
        UIView.transition(with: self,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: animation,
                          completion: completetion)
    }
}
