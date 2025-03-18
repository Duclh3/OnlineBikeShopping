//
//  TabItem.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 06/02/2025.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
    let id: String = UUID().uuidString
    let view: AnyView
    let icon: AnyView
}
