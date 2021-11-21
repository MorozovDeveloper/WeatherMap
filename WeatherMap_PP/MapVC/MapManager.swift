//
//  MapManager.swift
//  WeatherMap_PP
//
//  Created by Oleg on 24.10.2021.
//

import Foundation
import MapKit
import CoreLocation



//class MapManager, CLLocationManagerDelegate {
//
//    @IBOutlet weak var mapView: MKMapView!
//    
//let manager = CLLocationManager()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        manager.desiredAccuracy = kCLLocationAccuracyBest // battery
//        manager.delegate = self
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//        
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            manager.stopUpdatingLocation()
//            
//            render(location)
//        }
//    }
//    
//    func render(_ location: CLLocation) {
//        
//        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
//                                                longitude: location.coordinate.longitude)
//        let span = MKCoordinateSpan(latitudeDelta: 0.1,
//                                    longitudeDelta: 0.1)
//        let region = MKCoordinateRegion(center: coordinate,
//                                        span: span)
//        
//        mapView.setRegion(region, animated: true)
//    }
//    
//}
