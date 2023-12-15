//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/15/23.
//

import Foundation
import SwiftUI

@Observable
class BusinessViewModel {
    var query: String = ""
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    var service = DataService()
    
    func getBusinesses() {
        Task {
            businesses = await service.businessSearch()
        }
    }
}
