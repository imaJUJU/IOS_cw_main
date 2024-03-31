//
//  CategoryView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct CategoryView: View {
    var prds: [ProductModel]
    @Binding var cart: [ShoppingCartItem]
    private let categories = cats
    let categoryIcons = ["Dress_icon", "shirt_icon", "pants_icon", "rings_icon", "Shoes_icon","bags_icon","makeup_icon"]
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categories) { category in
                    Button(action: {
                        self.selectedCategory = category
                    }) {
                        VStack {
                            Image(categoryIcons[categories.firstIndex(where: { $0.id == category.id }) ?? 0])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 60)
                                .padding(10)
                                .background(Color(hex: "#5E460B", alpha: 0.31))
                                .clipShape(Circle())
                            
                            Text(category.name)
                                .font(.caption)
                                .foregroundColor(.brown)
                        }
                        
                    }
                }
            }
            .padding()
        }
        
        if let selectedCategory = selectedCategory {
            CategoryImageView(category: selectedCategory.name, prds: prds, cart: $cart)
                .padding(.top, 20)
            
        }
    }
}

#Preview {
    CategoryView(prds: products, cart: .constant([item1]))
}
