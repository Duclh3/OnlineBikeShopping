//
//  SmallRectangleItem.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 04/02/2025.
//

import Foundation
import Inject
import SwiftUI

struct SmallRectangleItem: View {
    @ObserveInjection private var redraw

    var stringImage: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [Color( "353F54ff"), Color( "222834ff")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .shadow(.drop(color: Color( "10141Cff").opacity(0.5), radius: 30, x: 0, y: -20))
                    .shadow(.drop(color: Color( "10141Cff"), radius: 30, x: 0, y: 30))
                )
                .stroke(
                    LinearGradient(
                        colors: [Color( "FFFFFFff"), Color( "000000ff").opacity(0.84), Color( "000000ff")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing).opacity(0.2),
                    lineWidth: 1)
                .overlay {
                    Image(stringImage)
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                }

                .frame(width: 50, height: 50)
        }
        .enableInjection()
    }
}
