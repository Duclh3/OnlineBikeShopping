//
//  CartItem.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 08/02/2025.
//

import Foundation
import SwiftUI

struct CartItem: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(colors: [Color("363E51ff"), Color("4C5770ff")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .stroke(LinearGradient(colors: [Color("FFFFFFff"), Color("000000ff")], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2))
                .overlay {
                    Image("mubaohiem")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 70)
                }
                .frame(width: 110, height: 90)
            VStack(alignment: .leading) {
                Text("PEUGEOT - LR01").fontWeight(.bold).font(.system(size: 15)).foregroundColor(.white)
                Spacer()
                Text("$ 1,999.99").font(.system(size: 13)).foregroundColor(Color("3C9EEAff"))
            }
            .padding(.vertical, 16)
            .padding(.leading, 8)
            Spacer()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "plus.app")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .frame(width: 24, height: 24)

                })
                Text("2")
                    .font(.system(size: 13)).fontWeight(.semibold)
                    .foregroundColor(.white)
                Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "minus.square")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white).opacity(0.4)
                        .frame(width: 24, height: 24)

                })
            }
        }
        .frame(height: 90)
        .background(Color("242C3Bff"))
    }
}
