//
//  CustomTabBarView.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 06/02/2025.
//

import Inject
import SwiftUI

struct CustomTabBarView: View {
    @ObserveInjection private var redraw
    @State var selectedTab = 0
    @Namespace private var namespace
    
    var tabItems: [TabItem]
    
    var tabBarHeight: CGFloat = 55
    
    var body: some View {
        GeometryReader { geo in
            
            HStack(spacing: 0) {
                ForEach(tabItems) { item in
                    item.view.containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                }
            }
            .animation(.easeInOut(duration: 0.3), value: selectedTab)
            .offset(x: -geo.size.width * CGFloat(selectedTab))
        }
        .padding(.bottom, tabBarHeight)
        .overlay(alignment: .bottom) {
            HStack {
                ForEach(tabItems.indices, id: \.self) { index in
                    Group {
                        Spacer()
                        Button {
                            selectedTab = index
                        } label: {
                            ZStack(alignment: .center) {
                                if selectedTab == index {
                                    ItemShape(cornerRadius: 10)
                                        .fill(
                                            LinearGradient(
                                                colors: [Color( "34C8E8ff"), Color( "4E4AF2ff")],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing).shadow(.drop(color: Color( "10141Cff"), radius: 30, y: 20))
                                        )
                                        .stroke(
                                            LinearGradient(
                                                colors: [Color( "FFFFFFff"), Color( "000000ff")],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing).opacity(0.2),
                                            lineWidth: 1)
                                        .frame(
                                            width: 60,
                                            height: 50)
                                        .offset(y: -30)
                                        .matchedGeometryEffect(id: "rec", in: namespace)
                                }
                                ItemShape(cornerRadius: 10)
                                    .fill(
                                        Color.clear)
                                    .stroke(
                                        Color.clear,
                                        lineWidth: 1)
                                    .frame(
                                        width: 60,
                                        height: 50)
                                    
                                    .overlay {
                                        tabItems[index].icon
                                            .offset(y: selectedTab == index ? -30 : 0)
                                    }
                            }
                            .padding(.top, 15)
                        }
                        Spacer()
                    }
                }
            }
            .frame(height: tabBarHeight)
            .background(LinearGradient(colors: [Color( "363E51ff"), Color( "181C24ff")], startPoint: .top, endPoint: .bottom))
        }
        .enableInjection()
    }
}
