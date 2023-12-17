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
    @State var dealsOn = false
    @State var popularOn = false
    @State var categorySelection = "restaurants"
    @State var query: String = ""
    @FocusState var queryBoxFocused: Bool
    @State var showOptions: Bool = false
    
    var body: some View {
        @Bindable var vm = vm
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation {
                            showOptions = true
                        }
                    }
                    .onSubmit {
                        withAnimation {
                            showOptions = false
                        }
                        
                            queryBoxFocused = false
                        
                        vm.getBusinesses(query: query,
                                         options: getOptionsString(),
                                         category: categorySelection)
                    }
                
                Button {
                    //Perform a search
                    withAnimation {
                        showOptions = false
                    }
                    
                        queryBoxFocused = false
                    
                    
                    vm.getBusinesses(query: query,
                                     options: getOptionsString(),
                                     category: categorySelection)
                    
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                
            }
            .padding()
            
            //Query options. Show if text box is focused.
            if showOptions {
                    VStack {
                        Toggle("Popular", isOn: $popularOn)
                        Toggle("Deals", isOn: $dealsOn)
                        
                        HStack {
                            Text("Category")
                            Spacer()
                            Picker("Category", selection: $categorySelection) {
                                Text("Restaurants")
                                    .tag("restaurants")
                                Text("Arts")
                                    .tag("arts")
                            }
                        }
                    }
                    .padding(.horizontal, 40)
                    .transition(.scale)
                }
            
            
            // Show Picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            // Show map or list
            if vm.locationAuthStatus == .denied {
                
                Spacer()
                Text("Please allow location services for this app to see sights near you.")
                    .padding(.horizontal)
               
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text("Open App Privacy Settings")

                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            else if selectedTab == 1 {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            } else {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                    }
            }
        }
        .sheet(item: $vm.selectedBusiness) { item in
            BusinessDetailView()
        }
        
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        } 
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
    }
    
}


#Preview {
    HomeView()
        .environment(BusinessViewModel())
}
