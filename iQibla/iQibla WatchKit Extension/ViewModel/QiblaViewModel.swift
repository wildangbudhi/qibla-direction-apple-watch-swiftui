//
//  QiblaViewModel.swift
//  iQibla WatchKit Extension
//
//  Created by Wildan Ghiffarie Budhi on 23/08/21.
//

import Foundation
import CoreLocation
import Combine

class QiblaViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var kabahCoordinate: Coordinate = Coordinate(latitude: 21.422487, longitude: 39.826206)
    
    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var currentCoordinate: Coordinate?
    @Published var qiblaBearing: Double = 0
    @Published var qiblaDirection: Double = 0
    
    override init() {
        super.init()
        print("init")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
    
    private func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
    private func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentCoordinate = Coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        qiblaBearing = GetAngelFromCurrentLocationToKabah()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        let north = self.degreesToRadians(-1 * heading.trueHeading)
        qiblaDirection = self.degreesToRadians(qiblaBearing) + north
        qiblaDirection = self.radiansToDegrees(qiblaDirection)
    }
    
    func GetAngelFromCurrentLocationToKabah() -> Double {
        
        let currLat: Double = self.degreesToRadians(self.currentCoordinate?.latitude ?? 0)
        let currLong: Double = self.degreesToRadians(self.currentCoordinate?.longitude ?? 0)
        
        let kabahLat: Double = self.degreesToRadians(self.kabahCoordinate.latitude)
        let kabahLong: Double = self.degreesToRadians(self.kabahCoordinate.longitude)
        
        let dLong: Double = kabahLong - currLong
        
        let y = sin(dLong) * cos(kabahLat)
        let x = cos(currLat) * sin(kabahLat) - sin(currLat) * cos(kabahLat) * cos(dLong)
        
        var radiansBearing = atan2(y, x)
        
        if(radiansBearing < 0.0){
            radiansBearing += 2 * Double.pi;
        }
        
        let kabahBearing: Double = self.radiansToDegrees(radiansBearing)
        
        return kabahBearing
        
    }
    
    
}
