//
//  MapView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/15/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(BusinessViewModel.self) var model
    @State var selectedBusinessId: String?
    
    var body: some View {
        
        Map(selection: $selectedBusinessId) {
            ForEach(model.businesses, id: \.id) { b in
                Marker(b.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(
                    latitude: b.coordinates?.latitude ?? 0,
                    longitude: b.coordinates?.longitude ?? 0))
                .tag(b.id ?? "None")
            }
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            // Find the business which matches this id
            let business = model.businesses.first { business in
                business.id == selectedBusinessId
            }
            
            // If the business is found, set it as the selected one
            if business != nil {
                model.selectedBusiness = business!
            }
        }
    }
}

#Preview {
    MapView()
        .environment(BusinessViewModel())
}
