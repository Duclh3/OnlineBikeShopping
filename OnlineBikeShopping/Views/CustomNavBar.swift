//
//  SwiftUIView.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 11/02/2025.
//

import SwiftUI

struct CustomNavBar: View {
    @Environment(\.dismiss) private var dismiss

    var title: String
    var subTitle: String
    var showBackButton: Bool

    var body: some View {
        HStack {
            if self.showBackButton {
                Button(action: {
                    self.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                })
            }
            Spacer()
            VStack {
                Text(self.title).font(.body).fontWeight(.semibold)
                Text(self.subTitle).font(.caption).fontWeight(.regular)
            }
            Spacer()
            if self.showBackButton {
                Image(systemName: "chevron.left")
                    .opacity(0)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .background(.blue.opacity(0.3))
        .frame(maxWidth: .infinity)
        
    }
}

extension View {
    func customTitle(_ title: String) -> some View {
        preference(key: TitlePreferenceKey.self, value: title)
    }

    func customSubTitle(_ subTitle: String) -> some View {
        preference(key: SubTitlePreferenceKey.self, value: subTitle)
    }

    func customShowBackButton(_ showBackButton: Bool) -> some View {
        preference(key: ShowBackButtonPreferenceKey.self, value: showBackButton)
    }

    func customNavBar(title: String, subTitle: String, showBackButton: Bool) -> some View {
        self
            .preference(key: TitlePreferenceKey.self, value: title)
            .preference(key: SubTitlePreferenceKey.self, value: subTitle)
            .preference(key: ShowBackButtonPreferenceKey.self, value: showBackButton)
    }
}
