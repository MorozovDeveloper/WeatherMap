//
//  KeyboardNotification.swift
//  WeatherMap_PP
//
//  Created by Oleg on 05.11.2021.
//

import Foundation
import UIKit


extension FloatingViewController {
    
    // KeyBoard
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc  func keyboardWillShow (notification: Notification){
        if let _ = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue { // есть ли клавиатура
            if view.frame.origin.y == 0{
                view.frame.origin.y = CGFloat.zero
                print("Open")
            }
        }
    }
    
    @objc  func keyboardWillHide (notification: Notification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0{
                view.frame.origin.y = keyboardSize.height + 70
            }
        }
    }
    
}
