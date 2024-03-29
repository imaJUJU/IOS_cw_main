//
//  SearchBarView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct SearchBarView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("SEARCH")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 8)
                TextField("Search Items", text: $search)
            }
            .padding(.all, 10)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("filter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding()
                    .background(Color(hex: "#5E460B"))
                    .cornerRadius(10.0)
            }
        }
        .padding()
    }
}

#Preview {
    SearchBarView()
}
