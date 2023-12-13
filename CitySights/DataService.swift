//
//  DataService.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async {
        
        // Check if API Key exists
        guard apiKey != nil else {
            return
        }
        
        // 1. Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=37.785834&longitude=-122.406417&categories=restaurants&limit=10") {
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // 3. Send request
            do {
                let (data,response) = try await URLSession.shared.data(for: request)
                
                print(data)
                print(response)
            } catch {
                print(error)
            }
        }
    }
}
