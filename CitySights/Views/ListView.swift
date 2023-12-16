//
//  ListView.swift
//  CitySights
//
//  Created by Danielle Lewis on 12/15/23.
//

import SwiftUI

struct ListView: View {
    @Environment(BusinessViewModel.self) var vm
    
    var body: some View {
        List{
            ForEach(vm.businesses) { b in
                VStack(spacing: 20) {
                    HStack {
                        
                        if let imageUrl = b.imageUrl {
                            // Display the business Image
                            if let url = URL(string: imageUrl) {
                                
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .padding(.trailing, 16)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            
                        } else {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                        }
                        
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
}

#Preview {
    ListView()
        .environment(BusinessViewModel())
}
