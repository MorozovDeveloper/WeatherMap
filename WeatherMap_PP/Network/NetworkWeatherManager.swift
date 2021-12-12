//
//  NetworkWeatherManager.swift
//  WeatherMap_PP
//
//  Created by Oleg on 11.11.2021.
// https://api.openweathermap.org/data/2.5/weather?q=Moscow&appid=7e3403ac663fef8ed47de5ca39a32c07&units=metric

import Foundation
import UIKit
import MapKit
import CoreLocation

extension FloatingViewController{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(searchBar.text!)&appid=7e3403ac663fef8ed47de5ca39a32c07&units=metric"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let currentWeather = self.parseJSON(withData: data)
                
                DispatchQueue.main.async {
                    if let mapVC = self.parent as? MapViewController {
                        mapVC.manager.desiredAccuracy = kCLLocationAccuracyBest// точность отображения
                        mapVC.manager.delegate = mapVC.self
                        mapVC.manager.requestWhenInUseAuthorization()// запрос авторизации
                        mapVC.manager.startUpdatingLocation()
                        
                        mapVC.pinText = currentWeather!.cityName
                        mapVC.subText = "\(currentWeather!.temperatureString)˚C"
                        mapVC.latCor = currentWeather!.lat
                        mapVC.lonCor = currentWeather!.lon
                        mapVC.image = UIImage(systemName:currentWeather!.systemIconNameString)!
                    }
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWheatherData = try decoder.decode(ModelWeather.self, from: data)
            guard let currentWeather = CurrentWeather(modelWeather: currentWheatherData) else {
                return nil
            }
            return currentWeather
        }
        
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
