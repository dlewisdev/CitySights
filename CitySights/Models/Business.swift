//
//  Business.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import Foundation


struct Business: Decodable {
    var alias: String?
    var categories: [Category]?
    var coordinates: Coordinate?
    var display_phone: String?
    var distance: Double?
    var id: String?
    var image_url: String?
    var is_closed: Bool?
    var location: Location?
    var name: String?
    var phone: String?
    var price: String?
    var rating: Int?
    var review_count: Int?
    var url: String?
}
