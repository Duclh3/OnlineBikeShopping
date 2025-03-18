//
//  BlueIconButton.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 07/02/2025.
//

import SwiftUI

struct BlueIconButton: View {
    var overlayView: AnyView
    var onClickButton: onButtonClick
    var width: CGFloat = 44
    var height: CGFloat = 44

    var body: some View {
        Button {
            onClickButton()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [Color( "34C8E8ff"), Color( "4E4AF2ff")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay {
                    overlayView.foregroundColor(.white)
                }
                .frame(width: width, height: height)
        }
    }
}
