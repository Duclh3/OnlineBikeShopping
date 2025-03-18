//
//  CustomNavBarContainer.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 11/02/2025.
//

import SwiftUI

struct CustomNavBarContainer<Content: View>: View {
    let content: Content

    @State private var title: String = ""
    @State private var subTitle: String = ""
    @State private var showBackButton: Bool = false
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            CustomNavBar(title: title, subTitle: subTitle, showBackButton: showBackButton)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden(true)
        .onPreferenceChange(TitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(SubTitlePreferenceKey.self, perform: { value in
            self.subTitle = value
        })
        .onPreferenceChange(ShowBackButtonPreferenceKey.self, perform: { value in
            self.showBackButton = value
        })
    }
}
