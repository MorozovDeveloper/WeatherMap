//
//  FloatingViewController.swift
//  WeatherMap_PP
//
//  Created by Oleg on 23.10.2021.
///

import UIKit


class FloatingViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var floatingView: UIView!
    
    var runningAnimations = [UIViewPropertyAnimator]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor.white
        }
        searchBar.barTintColor = floatingView.backgroundColor
        
        view.layer.cornerRadius = 20

        if self.view.frame.origin.y >= 0 {
            self.registerKeyboardNotification()
        }
        
    }
    
    deinit {
        removeKeyboardNotification()
    }

}


