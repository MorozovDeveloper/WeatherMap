//
//  Model.swift
//  WeatherMap_PP
//
//  Created by Oleg on 25.10.2021.
//

import Foundation


struct ModelWeather: Decodable {
    let coord : Coord
    let weather: [Weather]
    let name: String?
    let main: Main
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
}
