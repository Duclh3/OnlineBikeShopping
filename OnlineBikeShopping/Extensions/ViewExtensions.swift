//
//  ViewExtensions.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 08/02/2025.
//

import SwiftUI

public extension View {
    func topBarTitle(title: String, onButtonClick: onButtonClick?) -> some View {
        self.modifier(TopBarModifier(title: title, onButtonClick: onButtonClick))
    }
}
