//
//  CategoryImageView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-31.
//

import SwiftUI

struct CategoryImageView: View {
    var category: String
    var prds: [ProductModel]
    @Binding var cart: [ShoppingCartItem]
    
    var body: some View {
        VStack {
            Text(category)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    let catprod = productsForCategory(category: category)
                    
                    if catprod.count > 0 {
                        ForEach(catprod) { product in
                            NavigationLink(
                                destination: DetailsPage(product: product, cart: $cart),
                                label: {
                                    ProductCardView(product: product, cart: $cart, size: 150)
                                })
                            .navigationBarHidden(true)
                            .foregroundColor(.black)
                        }
                        .padding(.trailing)
                    } else {
                        Text("No products for category \(category)")
                            .padding()
                    }
                }
                .padding(.leading)
            }
        }
    }
    
    func productsForCategory(category: String) -> [ProductModel] {
        return prds.filter { $0.category.lowercased().contains(category.lowercased()) }
    }
}


#Preview {
    CategoryImageView(category: "Tshirt", prds: products, cart: .constant([]))
}
