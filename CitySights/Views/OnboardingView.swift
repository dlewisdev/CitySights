//
//  Onboarding.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/15/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var selectedViewIndex = 0
    @Environment(\.dismiss) var dismiss
    @Environment(BusinessViewModel.self) var vm
    var body: some View {
        ZStack {
            Color(selectedViewIndex == 0 ? Color(red: 111/255, green: 154/255, blue: 189/255) : Color(red: 139/255, green: 166/255, blue: 65/255))
                .ignoresSafeArea()
            
            TabView(selection: $selectedViewIndex) {
                OnboardingViewDetails(bgColor: Color(Color(red: 111/255, green: 154/255, blue: 189/255)), headline: "Welcome to City Sights", subHeadline: "City Sights helps you find the best of the city") {
                    
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                .tag(0)
                
                OnboardingViewDetails(bgColor: Color(Color(red: 139/255, green: 166/255, blue: 65/255)), headline: "Discover your city", subHeadline: "We'll show you the best restaurants, venues, and more, based on your location.") {
                    
                    //Ask user for permission to locate
                    vm.getUserLocation()
                    dismiss()
                }
                .tag(1)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack(spacing: 16) {
                    Spacer()
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    Circle()
                        .frame(width: 10)
                        .foregroundColor(selectedViewIndex == 1 ? .white : .gray)
                    
                    Spacer()
                }
                .padding(.bottom, 220)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
