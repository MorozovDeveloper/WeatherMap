//
//  FloatingViewController.swift
//  WeatherMap_PP
//
//  Created by Oleg on 23.10.2021.
//

import UIKit

class FloatingViewController: UIViewController {
    
    @IBOutlet weak var handleArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.view.frame.origin.y >= 0 {
            registerKeyboardNotification()
        } else {
            print("WWW")
        }
        
    }
    
    deinit {
        removeKeyboardNotification()
        registerKeyboardNotification2()
    }

    // KeyBoard
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyboardWillShow(notification:)),
//                                               name: UIResponder.keyboardWillHideNotification,
//                                               object: nil)
    }
    
    func registerKeyboardNotification2() {
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(keyboardWillShow(notification:)),
                                                       name: UIResponder.keyboardWillHideNotification,
                                                       object: nil)
    }

    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc private func keyboardWillShow (notification: Notification){
        if let _ = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue { // есть ли клавиатура
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y = CGFloat.zero
                print("Open")
            }
        }
    }
    
    @objc private func keyboardWillHide (notification: Notification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y = keyboardSize.height
            }
        }
    }

}
