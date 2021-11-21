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
    
    // for FloatingCard ->
    var floatingViewController : FloatingViewController!
    
    let cardHeight: CGFloat = 500
    let cardHandleAreaHeight: CGFloat = 65
    
    var pinText = ""
    var subText = 0.0
    var latCor = 0.0
    var lonCor = 0.0
    
    var cardVisible = false
    var nextState: CardState{
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    // <-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
        //mapView.delegate = self
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }

        func render(_ location: CLLocation) {

            let coordinate = CLLocationCoordinate2D(latitude: latCor,
                                                    longitude: lonCor)

            let span = MKCoordinateSpan(latitudeDelta: 1.0,
                                        longitudeDelta: 1.0) // маштаб

            let region = MKCoordinateRegion(center: coordinate,
                                            span: span)

            self.mapView.setRegion(region, animated: true)

            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            self.mapView.addAnnotation(pin)
            pin.title = pinText
            pin.subtitle = "\(subText)"
        }
    }
}


// Создаем баннер на маркере
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else {return nil}
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotaionIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotaionIdentifier)
            annotationView?.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "cloud")
        annotationView?.rightCalloutAccessoryView = imageView
        
        return annotationView
        
    }
    
}


