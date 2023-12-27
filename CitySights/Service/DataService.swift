//
//  DataService.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import Foundation
import CoreLocation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) async -> [Business] {
        
        // Check if API Key exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        // Default lat long
        var lat = 37.785834
        var long = -122.406417
        
        // User lat long
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        var endpointUrlString = "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&limit=10"
        
        //Add query
        if query != nil && query != "" {
            // Removes illegal characters and replaces them with characters allowed in query strings
            endpointUrlString.append("&term=\(query!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")
        }
        //Add options
        if options != nil && options != "" {
            endpointUrlString.append("&attributes=\(options ?? "")")
        }
        
        //Add category
        if let category = category {
            endpointUrlString.append("&categories=\(category)")
        }
        
        // 1. Create URL
        if let url = URL(string: endpointUrlString) {
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // 3. Send request
            do {
                let (data,response) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let searchResults = try decoder.decode(BusinessSearch.self, from: data)
                return searchResults.businesses
                
            } catch {
                print(error)
            }
        }
        
        return [Business]()
    }
}
