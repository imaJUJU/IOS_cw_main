//
//  HomeBar.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct HomeBar: View {
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: {}, label: {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 30)
        })
    }
}

#Preview {
    HomeBar(image: Image("home_white"), action: {})
}
