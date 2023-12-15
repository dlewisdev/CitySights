//
//  ContentView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(BusinessViewModel.self) var vm
    
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
            
            List{
                ForEach(vm.businesses) { b in
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
                        vm.selectedBusiness = b
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
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
    ContentView()
}
