//
//  SearchBarView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("Search Items", text: $searchText, onCommit: onSearch)
            }
            .padding(.all, 10)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(hex: "#5E460B"))
                    .cornerRadius(10.0)
            }
        }
    }
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), onSearch: {})
    }
}
