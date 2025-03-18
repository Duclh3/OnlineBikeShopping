//
//  ColorExtensions.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 05/02/2025.
//

import SwiftUI

public extension Color {
    init(_ hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF000000) >> 24) / 255.0
        let green = Double((rgb & 0x00FF0000) >> 16) / 255.0
        let blue = Double((rgb & 0x0000FF00) >> 8) / 255.0
        let alpha = Double(rgb & 0x000000FF) / 255.0

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
