//
//  File.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 10/02/2025.
//

import Foundation
import SwiftUI

struct TabarItemPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []

    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabarItemViewPreferenceKey: PreferenceKey {
    static var defaultValue: [IdentifiableAnyView] = []

    static func reduce(value: inout [IdentifiableAnyView], nextValue: () -> [IdentifiableAnyView]) {
        value += nextValue()
    }
}

extension View {
    func tabBarItem(tab: TabBarItem) -> some View {
        self
            .preference(key: TabarItemPreferenceKey.self, value: [tab])
//            .preference(key: TabarItemViewPreferenceKey.self, value: [IdentifiableAnyView(view: AnyView(self))])
    }
}
