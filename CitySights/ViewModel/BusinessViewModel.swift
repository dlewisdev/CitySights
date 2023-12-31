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
    
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    var locationAuthStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses(query: String?, options: String?, category: String?) {
        Task {
            businesses = await service.businessSearch(userLocation: currentUserLocation,
                                                      query: query,
                                                      options: options,
                                                      category: category)
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
        self.locationAuthStatus = manager.authorizationStatus
        
        // Detect if user allowed, then request locaiton
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentUserLocation == nil {
            // Most recent location is the last index in the locations array
            currentUserLocation = locations.last?.coordinate
            
            // Call business search
            getBusinesses(query: nil, options: nil, category: nil)
        }
        manager.stopUpdatingLocation()
    }
}
