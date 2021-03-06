//
//  KeyboardNotification.swift
//  WeatherMap_PP
//
//  Created by Oleg on 05.11.2021.
//

import Foundation
import UIKit

// KeyBoard
extension FloatingViewController {
    
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc  func keyboardWillHide (notification: Notification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0{
                view.frame.origin.y = keyboardSize.height + 30
            }
        }
    }

    
}
