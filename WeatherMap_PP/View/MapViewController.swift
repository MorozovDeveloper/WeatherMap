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
    
    var someDataModel = SomeDataModel()
    var floatingViewController = FloatingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()

        
    }
}



