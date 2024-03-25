//
//  CheckoutView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-24.
//

import SwiftUI

struct CheckoutView: View {
    @State private var selectedTab = 0
    
    var body: some View {
     
        HomeBarView(selectedTab: $selectedTab)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}


#Preview {
    CheckoutView()
}
