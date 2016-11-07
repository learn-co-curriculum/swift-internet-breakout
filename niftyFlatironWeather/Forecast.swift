//
//  Forecast.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftDate


struct Forecast{
    
    var currently: Currently
    var hourArray: [Hourly]
    var hourlyIcon: String
    var hourlySummary: String
    
    var dailyArray: [Daily]
    var dailyIcon: String
    var dailySummary:String
    
    var minuteArray: [Minutely]
    var minuteIcon: String
    var minuteSummary: String
    
    struct Currently{
        
        var time: String
        var summary: String
        var icon: String
        var nearestStormDistance: Double
        var nearestStormBearing: Double
        var precipIntensity: Double
        var precipProbability: Double
        var temperature: Double
        var apparentTemperature: Double
        var dewPoint: Double
        var humidity: Double
        var windSpeed: Double
        var windBearing: Double
        var visibiltiy: Double
        var cloudCover: Double
        var pressure: Double
        var ozone: Double


        init(dict: JSON){
            
            let timeDouble = dict["time"].doubleValue
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "EE:HH:m"
            let date = Date(timeIntervalSince1970: timeDouble)
            let dateString = dateformatter.string(from: date)
            //print("Currently \(date.inLocalRegion())")
            self.time = dateString
            self.summary = dict["summary"].stringValue
            self.icon = dict["icon"].stringValue
            self.nearestStormDistance = dict["icon"].doubleValue
            self.nearestStormBearing = dict["icon"].doubleValue
            self.precipIntensity = dict["precipIntensity"].doubleValue
            self.precipProbability = dict["precipProbability"].doubleValue
            self.temperature = dict["temperature"].doubleValue
            self.apparentTemperature = dict["apparentTemperature"].doubleValue
            self.dewPoint = dict["dewPoint"].doubleValue
            self.humidity = dict["humidity"].doubleValue
            self.windSpeed = dict["windSpeed"].doubleValue
            self.windBearing = dict["windBearing"].doubleValue
            self.visibiltiy = dict["visisbility"].doubleValue
            self.cloudCover = dict["cloudCover"].doubleValue
            self.pressure = dict["pressure"].doubleValue
            self.ozone = dict["ozone"].doubleValue
        }
    }
    
    struct Hourly{
        var time: String
        var summary: String
        var icon: String
        var precipIntensity: Double
        var precipProbability: Double
        var temperature: Double
        var apparentTemperature: Double
        var dewPoint: Double
        var humidity: Double
        var windSpeed: Double
        var windBearing: Double
        var visibiltiy: Double
        var cloudCover: Double
        var pressure: Double
        var ozone: Double
        
        
        init(dict: JSON){
            // TODO: - Fix Hourly Time
            let timeDouble = dict["time"].doubleValue
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "EE:HH:m"
            let date = Date(timeIntervalSince1970: timeDouble)
            let dateString = dateformatter.string(from: date)
            
            //print(dateString)
            self.time = dateString
            self.summary = dict["summary"].stringValue
            self.icon = dict["icon"].stringValue
            self.precipIntensity = dict["precipIntensity"].doubleValue
            self.precipProbability = dict["precipProbability"].doubleValue
            self.temperature = dict["temperature"].doubleValue
            self.apparentTemperature = dict["apparentTemperature"].doubleValue
            self.dewPoint = dict["dewPoint"].doubleValue
            self.humidity = dict["humidity"].doubleValue
            self.windSpeed = dict["windSpeed"].doubleValue
            self.windBearing = dict["windBearing"].doubleValue
            self.visibiltiy = dict["visisbility"].doubleValue
            self.cloudCover = dict["cloudCover"].doubleValue
            self.pressure = dict["pressure"].doubleValue
            self.ozone = dict["ozone"].doubleValue
        }

        
    }
 
    struct Daily{
        
        var time: String
        var summary: String
        var icon: String
        var nearestStormDistance: Double
        var nearestStormBearing: Double
        var precipIntensity: Double
        var precipIntensityMax: Double
        var precipProbability: Double
        var dewPoint: Double
        var humidity: Double
        var windSpeed: Double
        var windBearing: Double
        var visibiltiy: Double
        var cloudCover: Double
        var pressure: Double
        var ozone: Double

        var sunriseTime: String
        var sunsetTime: String
        var temperatureMinTime: String
        var temperatureMaxTime: String
        
        var moonPhase: Double
        var temperatureMin: Double
        
        var temperatureMax: Double
        
        
        
        init(dict: JSON){
            
            
            
            let timeDouble = dict["time"].doubleValue
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "EE"
            let date = Date(timeIntervalSince1970: timeDouble)
            let dateString = dateformatter.string(from: date)
            self.time = dateString
            self.time = "\(date.day)"
            self.summary = dict["summary"].stringValue
            self.icon = dict["icon"].stringValue
            self.nearestStormDistance = dict["icon"].doubleValue
            self.nearestStormBearing = dict["icon"].doubleValue
            self.precipIntensity = dict["precipIntensity"].doubleValue
            self.precipProbability = dict["precipProbability"].doubleValue
            //self.temperature = dict["temperature"].doubleValue
            //self.apparentTemperature = dict["apparentTemperature"].doubleValue
            self.dewPoint = dict["dewPoint"].doubleValue
            self.humidity = dict["humidity"].doubleValue
            self.windSpeed = dict["windSpeed"].doubleValue
            self.windBearing = dict["windBearing"].doubleValue
            self.visibiltiy = dict["visisbility"].doubleValue
            self.cloudCover = dict["cloudCover"].doubleValue
            self.pressure = dict["pressure"].doubleValue
            self.ozone = dict["ozone"].doubleValue
            self.precipIntensityMax = dict["precipIntensityMax"].doubleValue
            self.moonPhase = dict["moonPhase"].doubleValue
            self.temperatureMin = dict["temperatureMin"].doubleValue
            self.temperatureMax = dict["temperatureMax"].doubleValue

            
            let sunriseTimeValue = dict["sunriseTime"].doubleValue
            let sunriseDate = Date(timeIntervalSince1970: sunriseTimeValue)
            self.sunriseTime = "\(sunriseDate.hour)"
        //    print("\(sunriseDate.hour) \(sunriseDate.minute) \(sunriseDate.second)")
//            print(sunriseTimeValue)
//            print(sunriseDate.string())
//            
           // print(sunriseDate)
            let hourformatter = DateFormatter()
            hourformatter.dateFormat = "H"
            let sunriseString = hourformatter.string(from: sunriseDate)
        //    print(sunriseString)
            
            
            
            let sunsetTimeValue = dict["sunsetTime"].doubleValue
            let sunsetDate = Date(timeIntervalSince1970: sunsetTimeValue)
            //print("Sunset - \(sunsetDate)")
            self.sunsetTime = "\(sunsetDate.hour)"
            
            let temperatureMinValue = dict["temperatureMinTime"].doubleValue
            let temperatureMinDate = Date(timeIntervalSince1970: temperatureMinValue)
            self.temperatureMinTime = "\(temperatureMinDate.hour)"
            
            let temperatureMaxValue = dict["temperatureMaxTime"].doubleValue
            let temperatureMaxDate = Date(timeIntervalSince1970: temperatureMaxValue)
            self.temperatureMaxTime = "\(temperatureMaxDate.hour)"
            

            
            
        }
    }
    
    struct Minutely{
        
        var time: String
        var precipIntensity: Double
        var precipProbability: Double
        
        
        init(dict:JSON){
            let timeDouble = dict["time"].doubleValue
            let date = Date(timeIntervalSince1970: timeDouble)
            let dateFormatter = DateFormatter()
            self.time = dateFormatter.string(from: date)
            self.precipIntensity = dict["precipIntensity"].doubleValue
            self.precipProbability = dict["precipProbability"].doubleValue
        }

    }
    
    init(dict: JSON){
        let timezone = dict["timezone"].stringValue
        
        self.currently = Currently(dict: dict["currently"])
        self.dailySummary = dict["daily"]["summary"].stringValue
        self.dailyIcon = dict["daily"]["icon"].stringValue
        self.hourlySummary = dict["hourly"]["summary"].stringValue
        self.hourlyIcon = dict["hourly"]["icon"].stringValue
        self.minuteSummary = dict["minutely"]["summary"].stringValue
        self.minuteIcon = dict["minutely"]["icon"].stringValue
        
        var hourValues = [Hourly]()
        var dailyValues = [Daily]()
        var minuteValues = [Minutely]()
        let hourArray = dict["hourly"]["data"].arrayValue
        for hour in hourArray{
            let hour = Hourly(dict: hour)
            hourValues.append(hour)
        }
        
        let dailyArray = dict["daily"]["data"].arrayValue
        for daily in dailyArray{
            let day = Daily(dict: daily)
            dailyValues.append(day)
        }
        let minuteArray = dict["minutely"]["data"].arrayValue
        for minute in minuteArray{
            let minute = Minutely(dict: minute)
            minuteValues.append(minute)
        }
        self.dailyArray = dailyValues
        self.hourArray = hourValues
        self.minuteArray = minuteValues
        
        
    }

    
    
    
}




