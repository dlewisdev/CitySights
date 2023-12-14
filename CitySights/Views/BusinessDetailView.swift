//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/14/23.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack (alignment: .trailing){
                Image(.detailPlaceholder)
                    .resizable()
                VStack {
                    Spacer()
                    Image(.yelpAttribution)
                        .frame(width: 73, height: 36)
                }
            }
            .frame(height: 164)
            
            if let isClosed = business?.isClosed {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(isClosed ? .red : .green)
                    Text(isClosed ? "Closed" : "Open")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                .frame(height: 36)
            }
            
            ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(business?.name ?? "")
                            .font(.system(size: 21))
                            .bold()
                            .padding(.bottom, 10)
                        
                        Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                        Text("\(business?.location?.state ?? "") \(business?.location?.zipCode ?? ""), \(business?.location?.country ?? "")")
                            .padding(.bottom, 10)
                        
                        Image("regular_\(business?.rating ?? 0)")
                            .padding(.bottom, 16)
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "phone")
                                .padding(.trailing)
                            Text(business?.displayPhone ?? "")
                            Spacer()
                            Image(systemName: "arrow.right")
                                .bold()
                        }
                        .padding(.vertical, 12)
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "globe")
                                .padding(.trailing)
                            Text(business?.url ?? "")
                                .lineLimit(1)
                            Spacer()
                            Image(systemName: "arrow.right")
                                .bold()
                        }
                        .padding(.vertical, 12)
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right")
                                .font(.system(size: 13))
                                .padding(.trailing)
                            Text("\(business?.reviewCount ?? 0) reviews")
                            Spacer()
                            Image(systemName: "arrow.right")
                                .bold()
                        }
                        .padding(.vertical, 12)
                        
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }
    

#Preview {
    BusinessDetailView()
}
