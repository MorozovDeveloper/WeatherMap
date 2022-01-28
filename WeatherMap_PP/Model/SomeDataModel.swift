//
//  Model.swift
//  WeatherMap_PP
//
//  Created by Oleg on 25.12.2021.
//

import Foundation
import UIKit

class SomeDataModel {
    static var shared = SomeDataModel()
    private init() {}
    
    var pinText = ""
    var subText = ""
    var latCor = 0.0
    var lonCor = 0.0
    var image = UIImage()
    
    let cardHeight: CGFloat = 500
    let cardHandleAreaHeight: CGFloat = 65
    
    var cardVisible = false
    
    let annotaionIdentifier = "annotaionIdentifier"
    
}
