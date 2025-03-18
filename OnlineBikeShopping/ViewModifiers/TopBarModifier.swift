//
//  TopBarModifier.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 08/02/2025.
//

import Foundation
import SwiftUI

struct TopBarModifier: ViewModifier {
    var title: String = ""
    var onButtonClick: onButtonClick?

    func body(content: Content) -> some View {
        content
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    BlueIconButton(overlayView: AnyView(Image(systemName: "chevron.left"))) {
                        onButtonClick?()
                    }
                }
            })
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
    }
}
