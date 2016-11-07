//
//  ForecastApiClient.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ForecastApiClient{
    
    
    
    
    
    
    class func getWeather(location:(latitude: Double, longitude: Double), completion:@escaping (Forecast)->()){
        let url = "\(Secrets.apiUrl)\(Secrets.apiKey)/\(location.latitude),\(location.longitude)"
        Alamofire.request(url).responseJSON { (response) in
            if let data = response.data{
                let json = JSON(data: data)
                let forecast = Forecast(dict: json)
                //print(forecast.currently.apparentTemperature)
                completion(forecast)
            }
        }
    }
    
    class func getWeather(at date:String, location:(latitude: Double, longitude: Double), completion:@escaping (Forecast)->()){
        let url = "\(Secrets.apiUrl)\(Secrets.apiKey)/\(location.latitude),\(location.longitude),\(date)"
        Alamofire.request(url).responseJSON { (response) in
            if let data = response.data{
                let json = JSON(data: data)
                let forecast = Forecast(dict: json)
                //print(forecast.currently.apparentTemperature)
                completion(forecast)
            }
        }
    }
    
    
    
    
    
    
    
    
    /*
    class func getWeatherFromAPI(for timePeriod:ForecastType, completion:@escaping ([Forecast])->()){
        
        var forecastsArray = [Forecast]()
        
        let url = "\(Secrets.apiUrl)\(Secrets.apiKey)"
        Alamofire.request(url).responseJSON { response in
            // parse json in some way
            
            if let data = response.data{
                var json = JSON(data: data)
                var periodJson = json["\(timePeriod)"]
                
                switch timePeriod{
                case .currently:
                    var currentlyForecast = Forecast(dict: periodJson)
                    forecastsArray.append(currentlyForecast)
                    break
                case .hourly:
                    var hourlyJsonArray = periodJson["data"].arrayValue
                    for hourly in hourlyJsonArray{
                        var forecast = Forecast(dict: hourly)
                        forecastsArray.append(forecast)
                    }
                    break
                case .daily:
                    var dailyJsonArray = periodJson["data"].arrayValue
                    for daily in dailyJsonArray{
                        var forecast = Forecast(dict: daily)
                        forecastsArray.append(forecast)
                    }
                    break
                }

            }
            
           
            completion(forecastsArray)
            
            
           
            
        }
        
    }
    */


    
    
}
