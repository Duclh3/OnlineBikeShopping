//
//  CustomNavigationLink.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 11/02/2025.
//

import SwiftUI

struct CustomNavigationLink<Destination: View, Label: View>: View {
    let destination: Destination
    let label: Label
    
    init(@ViewBuilder label: () -> Label, destination: Destination) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(destination: CustomNavBarContainer(content: {
            destination
        })) {
            label
        }
    }
}
