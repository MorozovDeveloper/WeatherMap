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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()

    }
}



