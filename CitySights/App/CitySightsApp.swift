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
        }
    }
}
