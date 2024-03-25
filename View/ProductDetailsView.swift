//
//  ProductDetailsView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-24.
//

import SwiftUI

struct ProductDetailsView: View {
    @State private var selectedTab = 0
    
    var body: some View {
       
        HomeBarView(selectedTab: $selectedTab)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
#Preview {
    ProductDetailsView()
}
