//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/14/23.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "")
    }
}

#Preview {
    BusinessDetailView()
}
