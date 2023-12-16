//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/15/23.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessViewModel: NSObject, CLLocationManagerDelegate {
    var query: String = ""
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses() {
        Task {
            businesses = await service.businessSearch(userLocation: currentUserLocation)
        }
    }
    
    func getUserLocation() {
        //Check if we have permission
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Detect if user allowed, then request locaiton
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Most recent location is the last index in the locations array
        currentUserLocation = locations.last?.coordinate
        if currentUserLocation != nil {
            // Call business search
            getBusinesses()
        }
        manager.stopUpdatingLocation()
    }
}
