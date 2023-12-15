//
//  ContentView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(BusinessViewModel.self) var vm
    @State var selectedTab = 0
    var body: some View {
        @Bindable var vm = vm
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $vm.query)
                
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
            .padding(.horizontal)
            
            // Show Picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            
            // Show map or list
            if selectedTab == 1 {
                MapView()
            } else {
                ListView()
            }
        }
        .onAppear {
            vm.getBusinesses()
        }
        .sheet(item: $vm.selectedBusiness) { item in
            BusinessDetailView()
        }
        
    }
    
}


#Preview {
    HomeView()
        .environment(BusinessViewModel())
}
