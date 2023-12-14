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
            
            List(businesses) { business in
                Text(business.name ?? "Nil")
            }
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }
    }
    
}


#Preview {
    ContentView()
}
