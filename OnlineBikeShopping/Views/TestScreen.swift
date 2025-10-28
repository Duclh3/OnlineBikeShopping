//
//  TestScreen.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 22/03/2025.
//

import Inject
import SwiftUI

struct TestScreen: View {
    @ObserveInjection
    private var redraw

    @State
    private var user: UserModel = .init(name: "name", age: 25)

    init() {}

    var body: some View {
        VStack {
            Text("Parent View: \(user.name) - \(user.age)")
            SubTestView(user: Binding(get: {
                UserModel(name: "HIHI", age: 26)
            }, set: { newValue in
                user = newValue
            }))
        }
            .enableInjection()
    }
}

struct SubTestView: View {
    @Binding
    var user: UserModel

    var body: some View {
        VStack {
            Text("Subview: \(user.name) - \(user.age)")
            Button(action: {
                user.changeName(newValue: "new name")
            }, label: {
                Text("Button")
            })
        }
    }
}
