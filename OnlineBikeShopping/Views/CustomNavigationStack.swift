//
//  CustomNavBarContainer.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 11/02/2025.
//

import SwiftUI

struct CustomNavigationStack<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack {
            CustomNavBarContainer {
                content
            }
        }
    }
}
