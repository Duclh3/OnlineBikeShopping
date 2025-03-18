//
//  CustomTabBarView2.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 10/02/2025.
//

import SwiftUI

struct CustomTabBarItem: View {
    @Binding var tabItems: [TabBarItem]

    @Binding var selection: TabBarItem

    var body: some View {
            HStack {
                ForEach(tabItems, id: \.self) { item
                    in
                    tabItemView(tab: item)
                        .onTapGesture {
                            switchToTab(tab: item)
                        }
                }
            }
            .padding()
            .ignoresSafeArea(edges: .bottom)
    }
}

extension CustomTabBarItem {
    private func tabItemView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
            Text(tab.title).font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }

    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeOut) {
            selection = tab
        }
    }
}
