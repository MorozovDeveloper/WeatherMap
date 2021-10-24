//
//  MapManager.swift
//  WeatherMap_PP
//
//  Created by Oleg on 24.10.2021.
//

import Foundation
import MapKit

class MapManager {
    
    let locationManager = CLLocationManager()
    private var placeCoordinate: CLLocationCoordinate2D?
    
    // Метка на карте
    func setupPlacemark (place: Place, mapKit: MKMapView) {
        guard let location = place.location else {return}
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let placemarks = placemarks else {return}
            let placemark = placemarks.first // получили метку на карте
            
            let annotation = MKPointAnnotation() // описание точки на карте
            annotation.title = place.name
            annotation.subtitle = place.type
            
            guard let placemarkLocation = placemark?.location else {return} // определяем положение маркера
            annotation.coordinate = placemarkLocation.coordinate
            self.placeCoordinate = placemarkLocation.coordinate
            // выделяем маркер аннотации
            mapKit.showAnnotations([annotation], animated: true)
            mapKit.selectAnnotation(annotation, animated: true)
        }
    }
    
    
    
}
