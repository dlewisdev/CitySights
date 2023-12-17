//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/13/23.
//

import SwiftUI

@main
struct CitySightsApp: App {
    @State var vm = BusinessViewModel()
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(vm)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // TODO on dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                        .environment(vm)
                }
                .onAppear {
                    //If no onboarding is needed, still get location
                    if needsOnboarding == false && vm.locationAuthStatus == .notDetermined {
                        vm.getUserLocation()
                    }
                }
               
        }
       
    }
}
