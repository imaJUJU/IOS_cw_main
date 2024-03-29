//
//  AdvertisementView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct AdvertisementView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("New")
                    .font(.custom("Optima", size: 35))
                    .foregroundColor(.black)
                    .italic()
                Text("    Collection")
                    .font(.custom("Optima", size: 35))
                    .foregroundColor(.black)
                    .italic()
                
                Button(action: {
                    // Add action to navigate to the shop page
                }) {
                    Text("Shop Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 5) // Adjust padding as needed
                        .padding(.horizontal, 10) // Adjust padding as needed
                        .background(Color(hex: "#5E460B"))
                        .cornerRadius(10)
                }
            }
            
            Image("pic1") // Replace with your image
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(30.0)
                .foregroundColor(.brown)
        }
        .padding(20)
    }
}

#Preview {
    AdvertisementView()
}
