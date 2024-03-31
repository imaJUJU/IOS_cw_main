//
//  ProductCardView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI
import Kingfisher

struct ProductCardView: View {
    let product: ProductModel
    @Binding var cart: [ShoppingCartItem]
    let size: CGFloat
    var body: some View {
        VStack {
            
            KFImage(URL(string: product.imageURL))
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0..<product.rating) { item in
                    Image("star")
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                }
                Spacer()
                
                Text("Rs.\(product.price)")
                    .font(.caption)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }
        }
        .frame(width: 150)
        .padding()
        .background(Color.gray.opacity(0.1))
    }

}

#Preview {
    ProductCardView(product: product1, cart: .constant([item1]), size: 150)
}
