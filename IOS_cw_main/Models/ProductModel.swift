//
//  ProductModel.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import Foundation

struct ProductModel : Identifiable, Decodable {
    let id: Int
    let name: String
    let price: String
    let sex: String
    let description: String
    let imageURL: String
    let rating: Int
    let category: String
}
