//
//  ContentView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import SwiftUI

struct ContentView: View {
   @State var query: String = ""
    var service = DataService()
    
    var body: some View {
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
        .padding()
        .task {
            await service.businessSearch()
        }
        
    }
}

#Preview {
    ContentView()
}
