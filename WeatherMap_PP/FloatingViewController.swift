//
//  FloatingViewController.swift
//  WeatherMap_PP
//
//  Created by Oleg on 23.10.2021.
//

import UIKit


class FloatingViewController: UIViewController {
    
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var model: ModelWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        if self.view.frame.origin.y >= 0 {
            registerKeyboardNotification()
        }
    }
    
    deinit {
        removeKeyboardNotification()
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

// Networking
extension FloatingViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(searchBar.text!)&appid=7e3403ac663fef8ed47de5ca39a32c07"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data else {return}
            
            do {
                let decodeJSON = JSONDecoder()
                self.model = try decodeJSON.decode(ModelWeather.self, from: data)
                
                DispatchQueue.main.async {
                    if let mapVC = self.parent as? MapViewController {
                        mapVC.testLabel.text = self.model.name
                    }
                    print("City", self.model.name)
                }
            } catch {
                print (error, "ERROR")
            }
            
        }.resume()
        
    }
    
}
 

