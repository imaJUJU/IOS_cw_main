//
//  CartModel.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-29.
//

import Foundation

import Foundation

struct ShoppingCartItem: Identifiable {
    let id = UUID()
    let product: ProductModel
    let quantity: Int
    let price: Double
}
