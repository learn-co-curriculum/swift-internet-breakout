//
//  DataStore.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation


class DataStore{
    static let sharedInstance = DataStore()
    private init(){}
    var forecast: Forecast!
    
    
    func fetchForecast(location:(latitude:Double,longitude:Double),completion:@escaping ()->()){
        print("runnign")
        ForecastApiClient.getWeather(location: location) { (forecast) in
            print("running")
            self.forecast = forecast
            completion()
            
        }
    }
    
    
}
