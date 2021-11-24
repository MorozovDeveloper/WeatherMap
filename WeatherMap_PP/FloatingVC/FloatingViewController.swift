//
//  FloatingViewController.swift
//  WeatherMap_PP
//
//  Created by Oleg on 23.10.2021.
//

import UIKit


class FloatingViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var model: ModelWeather!
    var mapViewController: MapViewController!
    
    let cardHeight: CGFloat = 500
    let cardHandleAreaHeight: CGFloat = 65
    
//    var cardVisible = false
//    var nextState: CardState{
//        return cardVisible ? .collapsed : .expanded
//    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        view.layer.cornerRadius = 20

        if self.view.frame.origin.y >= 0 {
            self.registerKeyboardNotification()  // убрать как функцию в Keyboardnotification
        }
    }
    
    deinit {
        removeKeyboardNotification()
    }

}


