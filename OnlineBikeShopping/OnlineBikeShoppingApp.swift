//
//  OnlineBikeShoppingApp.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 02/02/2025.
//

import SwiftUI

@main
struct OnlineBikeShoppingApp: App {
    @State var selection: TabBarItem = .init(iconName: "house", title: "Home", color: Color.red)

    @State var selection2: Int = 0
    var body: some Scene {
        WindowGroup {
//            TabView(selection: $selection2) {
//                Color.red.ignoresSafeArea()
//                    .tag(0)
//                    .onTapGesture {
//                        selection2 = 2
//                    }
//                Color.blue.ignoresSafeArea()
//                    .tag(1)
//                Color.green.ignoresSafeArea()
//                    .tag(2)
//            }
//            .tabViewStyle(.page(indexDisplayMode: .always))
            
            
            
//                        CustomTabBarView2(selection: $selection) {
//                            Color.red.ignoresSafeArea(.all)
//                                .tabBarItem(tab: .init(iconName: "house", title: "Home", color: Color.red))
//                            Color.blue.ignoresSafeArea(.all)
//                                .tabBarItem(tab: .init(iconName: "heart", title: "Favorites", color: Color.blue))
//                            Color.white.ignoresSafeArea(.all)
//                                .tabBarItem(tab: .init(iconName: "person", title: "Profile", color: Color.white))
//                        }
            TestScreen()
            
            

//            CustomTabBarView(tabItems: [
//                .init(view: AnyView(Text("123")), icon: AnyView(Image(systemName: "house"))),
//                .init(view: AnyView(Text("234")), icon: AnyView(Image(systemName: "house"))),
//                .init(view: AnyView(Text("456")), icon: AnyView(Image(systemName: "house"))),
//            ])

            
            
//            CustomNavigationStack {
//                ZStack {
//                    Color.orange.ignoresSafeArea()
//                    CustomNavigationLink(
//                        label: {
//                            Text("Screen 2")
//
//                        },
//                        destination: Text("new screen")
//                            .customNavBar(title: "Screen 2", subTitle: "screen 2", showBackButton: true)
//
//                    )
//                }
//                .customNavBar(title: "Screen 1", subTitle: "screen 1", showBackButton: true)
//            }
        }
    }
}
