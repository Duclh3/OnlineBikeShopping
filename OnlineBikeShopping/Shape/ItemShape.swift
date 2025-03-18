//
//  ItemShape.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 04/02/2025.
//

import Foundation
import SwiftUI

struct ItemShape: Shape {
    var cornerRadius: CGFloat = 0
    var offsetHeightPercent: CGFloat = 0.1
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.minX, y: cornerRadius + rect.maxY * offsetHeightPercent))
            path.addArc(
                center: .init(x: cornerRadius, y: cornerRadius + rect.maxY * offsetHeightPercent),
                radius: cornerRadius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false)
            
            path.addLine(to: .init(x: rect.maxX - cornerRadius, y: rect.minY))
            path.addArc(
                center: .init(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 360),
                clockwise: false)
            
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY - rect.maxY * offsetHeightPercent - cornerRadius))
            path.addArc(
                center: .init(x: rect.maxX - cornerRadius, y: rect.maxY - rect.maxY * offsetHeightPercent - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false)
            
            path.addLine(to: .init(x: rect.minX + cornerRadius, y: rect.maxY))

            path.addArc(
                center: .init(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false)
            
            path.addLine(to: .init(x: rect.minX, y: cornerRadius + rect.maxY * offsetHeightPercent))
        }
    }
}
