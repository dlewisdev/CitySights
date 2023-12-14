//
//  ContentView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @State var businesses = [Business]()
    var service = DataService()
    @State var selectedBusiness: Business?
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                
                Button {
                    
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            
            List{
                ForEach(businesses) { b in
                    VStack(spacing: 20) {
                        HStack {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                            VStack(alignment: .leading) {
                                Text(b.name ?? "Restaurant")
                                    .font(.system(size: 15))
                                    .bold()
                                Text(TextHelper.distanceAwayText(meters: b.distance ?? 0))
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                            }
                            Spacer()
                            Image("regular_\(b.rating ?? 0)")
                            
                        }
                        ZStack {
                            Divider()
                            Divider()
                            Divider()
                        }
                    }
                    .onTapGesture {
                        selectedBusiness = b
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .task {
            businesses = await service.businessSearch()
        }
        .sheet(item: $selectedBusiness) { item in
            BusinessDetailView(business: item)
        }
        
    }
    
}


#Preview {
    ContentView()
}
