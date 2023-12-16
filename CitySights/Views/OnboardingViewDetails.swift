//
//  OnboardingViewDetails.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/15/23.
//

import SwiftUI

struct OnboardingViewDetails: View {
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            Color(bgColor)
            
            VStack(spacing: 0) {
                
                Spacer()
                Spacer()
                
                Image(.onboarding)
                
                Text(headline)
                    .font(.system(size: 22))
                    .bold()
                    .padding(.top, 32)
                
                Text(subHeadline)
                    .padding(.top, 4)
                    .padding(.horizontal)
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(.white)
                            .frame(height: 50)
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.bottom, 81)
                .padding(.horizontal)
            }
            .foregroundStyle(.white)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingViewDetails(bgColor: Color(Color(red: 111/255, green: 154/255, blue: 189/255)), headline: "Welcome to City Sights", subHeadline: "City Sights helps you find the best of the city") {
        // Button action: nothing
    }
}
