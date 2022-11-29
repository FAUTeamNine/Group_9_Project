//
//  OpenWeatherApi.swift
//  Rainy
//
//  Created by Santiago Monsalve  on 11/21/22.
//

import Foundation

class OpenWeather {
    
    let apiKey: String = "b99c8417a38cd552c8fda11f22bbb202"
    let group = DispatchGroup()
    var weather = [[String:Any]]()

    
    func getLocalWeather(zipCode: Int, success: @escaping ([String:Any]) -> ()){
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
    
    func getCoordinates(zipCode: Int) -> [Int]{
        
        var lat = Int()
        var lon = Int()
        var coordinates: [Int] = []
        group.enter()
        
        DispatchQueue.global().async{
        
        self.getLocalWeather(zipCode: zipCode, success: {rawData in
            
            let data = rawData["coord"] as! [String: Any]
            lat = Int(data["lat"] as! Double)
            lon = Int(data["lon"] as! Double)
            self.group.leave()
            
        })
        
    }
       
        group.wait()
        
        coordinates.append(lat)
        coordinates.append(lon)
        
        return coordinates
        
    }
    
    func getForecast(zipCode: Int){
        
        var forecast = [[String: Any]]()
        var coordinates = [Int]()
        
        coordinates = self.getCoordinates(zipCode: zipCode)
        
        
        
        
        
    }
}
