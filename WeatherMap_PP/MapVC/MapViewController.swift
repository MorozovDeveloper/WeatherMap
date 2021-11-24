//
//  ViewController.swift
//  WeatherMap_PP
//
//  Created by Oleg on 23.10.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    let annotaionIdentifier = "annotaionIdentifier"
    
    var pinText = ""
    var subText = ""
    var latCor = 0.0
    var lonCor = 0.0
    var image = UIImage()
    
    // for FloatingCard ->
  // var floatingViewController : FloatingViewController!
    
//    let cardHeight: CGFloat = 500
//    let cardHandleAreaHeight: CGFloat = 65

//    var cardVisible = false
//    var nextState: CardState{
//        return cardVisible ? .collapsed : .expanded
//    }
//
//    var runningAnimations = [UIViewPropertyAnimator]()
    // <-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
    }
}



