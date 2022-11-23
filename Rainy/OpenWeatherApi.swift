//
//  OpenWeatherApi.swift
//  Rainy
//
//  Created by Santiago Monsalve  on 11/21/22.
//

import Foundation

class OpenWeather {
    
    static let apiKey: String = "b99c8417a38cd552c8fda11f22bbb202"
    var weather = [[String:Any]]()
    
    static func getLocalWeather(zipCode: Int, success: @escaping ([String:Any]) -> ()){
        let rawURL = "https://api.openweathermap.org/data/2.5/weather?zip=\(zipCode)&appid=\(apiKey)&units=imperial"
        guard let url = URL(string: rawURL) else {
            print ("[ERROR]There was an issue with URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data,options: []) as! [String: Any]
                success(dataDictionary)
            }
        }
        task.resume()
        
    }
    
}
