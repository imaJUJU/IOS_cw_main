//
//  CartModel.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-29.
//

import Foundation

struct ShoppingCartItem: Identifiable {
    var id = UUID()
    var product: ProductModel
    var quantity: Int
    var price: Double
    
}
