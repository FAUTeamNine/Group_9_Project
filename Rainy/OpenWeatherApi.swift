//
//  OpenWeatherApi.swift
//  Rainy
//
//  Created by Santiago Monsalve  on 11/21/22.
//

import Foundation

class OpenWeather {
    
    var onSuccess: (() -> ())?
    var onError: ((Error) -> ())?
    static let apiKey: String = "b99c8417a38cd552c8fda11f22bbb202"
    
    static func getLocalWeather(zipCode: Int){
        let rawURL = "https://api.openweathermap.org/data/2.5/weather?zip=\(zipCode)&appid=\(apiKey)"
        guard let url = URL(string: rawURL) else {
            print ("[ERROR]There was an issue with URL")
            return
        }
        
        
        
    }
    
}
