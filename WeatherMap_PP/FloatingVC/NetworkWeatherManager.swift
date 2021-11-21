//
//  NetworkWeatherManager.swift
//  WeatherMap_PP
//
//  Created by Oleg on 11.11.2021.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

extension FloatingViewController{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(searchBar.text!)&appid=7e3403ac663fef8ed47de5ca39a32c07&units=metric"
        //let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=7e3403ac663fef8ed47de5ca39a32c07"
         
       guard let url = URL(string: urlString) else {return}

       URLSession.shared.dataTask(with: url) { data, response, error in
           guard let data = data else {return}

           do {
               let decodeJSON = JSONDecoder()
               self.model = try decodeJSON.decode(ModelWeather.self, from: data)

               DispatchQueue.main.async {
                  if let mapVC = self.parent as? MapViewController {
                 //   mapVC.testLabel.text = self.model.name
                      mapVC.manager.desiredAccuracy = kCLLocationAccuracyBest
                      mapVC.manager.delegate = mapVC.self
                      mapVC.manager.requestWhenInUseAuthorization()
                      mapVC.manager.startUpdatingLocation()
                      
                      mapVC.pinText = self.model.name!
                      mapVC.subText = self.model.main.temp
                      mapVC.latCor = self.model.coord.lat
                      mapVC.lonCor = self.model.coord.lon
                   }
                   
                   print("City", self.model.name)
               }
               
           } catch {
               print (error, "ERROR")
           }

       }.resume()
    }
}
