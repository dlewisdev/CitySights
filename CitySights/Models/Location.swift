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
    var display_address: [String]?
    var state: String?
    var zip_code: String?
}
