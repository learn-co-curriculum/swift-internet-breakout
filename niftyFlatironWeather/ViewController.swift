//
//  ViewController.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/27/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation
import SnapKit
import Charts




class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
    var store = DataStore.sharedInstance
    var barChartView: BarChartView!
    var hours = [String]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        
        self.barChartView = BarChartView()
        barChartView.backgroundColor = UIColor.green
        barChartView.noDataText = "No forecast data"
        self.view.addSubview(barChartView)
        barChartView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.height.equalTo(self.view)
        }
        
        
        store.fetchForecast(location: (latitude,longitude)) {
            print("running")
            var forecast = [Double]()
            
            for hour in self.store.forecast.hourArray{
                forecast.append(hour.apparentTemperature)
                self.hours.append(hour.time)
                
            }
            self.setChart(dataPoints: self.hours, values: forecast)
            OperationQueue.main.addOperation {
                
//                
//                let view = forecast.lineGraph(range: GraphRange(min: minForecast-5, max: maxForecast)).view(frame: CGRect.zero)
//                view.backgroundColor = UIColor.lightGray
//                self.view.addSubview(view)
//                view.snp.makeConstraints { (make) in
//                    make.width.equalTo(self.view)
//                    make.height.equalTo(100)
//                    make.top.equalTo(self.view.snp.centerY)
//                    make.left.equalTo(self.view)
//                }

            }
            
        }
        
        
        
        
        //let view = (1 ... 10).barGraph(GraphRange(min: 0, max: 11)).view(viewFrame)
        
     
    }

    
    func setChart(dataPoints: [String], values: [Double]){
        self.barChartView.noDataText = "You need to provide data for the chart"
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count{
            let dataEntry = BarChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units")
        let chartData = BarChartData(
        
    }
    
    


}






extension ViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.requestLocation()
       self.latitude =  (locationManager.location?.coordinate.latitude)!
       self.longitude = (locationManager.location?.coordinate.longitude)!
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

