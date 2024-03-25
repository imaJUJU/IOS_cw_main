//
//  ShoppingCartView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-24.
//

import SwiftUI

struct ShoppingCartView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab = 0
    var body: some View {
        
        VStack {
            Text("Shopping Cart View")
            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        HomeBarView(selectedTab: $selectedTab)
    }
}

#if DEBUG
struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView()
    }
}
#endif
#Preview {
    ShoppingCartView()
}
