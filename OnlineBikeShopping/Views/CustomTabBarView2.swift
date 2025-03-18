//
//  CustomTabBarView2.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 10/02/2025.
//

import Inject
import SwiftUI

struct CustomTabBarView2<Views>: View {
    @Binding var selection: TabBarItem

    private let views: [AnyView]
    @State private var tabs: [TabBarItem] = []

    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> TupleView<Views>) {
        _selection = selection
        views = content().getViews
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                GeometryReader(content: { geo in
                    HStack(spacing: 0) {
                        ForEach(views.indices, id: \.self) { index in
                            views[index]
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        }
                    }
                    .offset(x: -geo.size.width * CGFloat(getSelectedIndex()))
                })
            }
            CustomTabBarItem(tabItems: $tabs, selection: $selection)
        }
        .onPreferenceChange(TabarItemPreferenceKey.self, perform: { newTab in
            tabs = newTab
        })
    }

    private func getSelectedIndex() -> Int {
        return tabs.firstIndex(of: selection) ?? 0
    }
}
