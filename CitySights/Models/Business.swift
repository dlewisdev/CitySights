//
//  Business.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import Foundation


struct Business: Identifiable, Decodable {
    var alias: String?
    var categories: [Category]?
    var coordinates: Coordinate?
    var displayPhone: String?
    var distance: Double?
    var id: String?
    var imageUrl: String?
    var isClosed: Bool?
    var location: Location?
    var name: String?
    var phone: String?
    var price: String?
    var rating: Double?
    var reviewCount: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case displayPhone = "display_phone"
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        
        case alias
        case categories
        case coordinates
        case distance
        case id
        case location
        case name
        case phone
        case price
        case rating
        case url
    }
}
