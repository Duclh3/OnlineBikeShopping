//
//  IdentifiableAnyView.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 10/02/2025.
//

import Foundation
import SwiftUI

struct IdentifiableAnyView: Identifiable, Equatable {
    let id = UUID()
    let view: AnyView
    
    static func == (lhs: IdentifiableAnyView, rhs: IdentifiableAnyView) -> Bool {
        lhs.id == rhs.id
    }
}
