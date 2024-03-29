//
//  ColorExtension.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1.0) {
        var hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&rgb)
        
        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}
