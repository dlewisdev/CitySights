//
//  Location.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import Foundation

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var country: String?
    var displayAddress: [String]?
    var state: String?
    var zipCode: String?
    
    enum CodingKeys: String, CodingKey {
        case address1
        case address2
        case address3
        case city
        case country
        case displayAddress = "display_address"
        case state
        case zipCode = "zip_code"
    }
}

