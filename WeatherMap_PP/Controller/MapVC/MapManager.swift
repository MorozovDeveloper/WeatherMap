//
//  MapManager.swift
//  WeatherMap_PP
//
//  Created by Oleg on 24.10.2021.
//

import UIKit
import MapKit
import CoreLocation


// Создаем маркер и баннер
extension MapViewController: MKMapViewDelegate {
    
    // Метка
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
        
        func render(_ location: CLLocation) {
            let coordinate = CLLocationCoordinate2D(latitude: SomeDataModel.shared.latCor,
                                                    longitude: SomeDataModel.shared.lonCor)
            let span = MKCoordinateSpan(latitudeDelta: 1.0,
                                        longitudeDelta: 1.0) // маштаб
            
            let region = MKCoordinateRegion(center: coordinate,
                                            span: span)
            
            self.mapView.setRegion(region, animated: true)
            
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            self.mapView.addAnnotation(pin)
            pin.title = SomeDataModel.shared.pinText
            pin.subtitle = "\(SomeDataModel.shared.subText)"
            self.mapView.selectAnnotation(pin, animated: true)
        }
    }
    
    // Баннер
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {return nil}
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: SomeDataModel.shared.annotaionIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: SomeDataModel.shared.annotaionIdentifier)
            annotationView?.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = SomeDataModel.shared.image
        annotationView?.rightCalloutAccessoryView = imageView
        
        return annotationView
    }
    
}

