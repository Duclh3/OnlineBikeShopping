//
//  CartScreen.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 08/02/2025.
//

import Inject
import SwiftUI

struct CartScreen: View {
    @ObserveInjection private var redraw
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color("242C3Bff").ignoresSafeArea(.all)
            VStack {
                Spacer().frame(height: 20)
                ScrollView {
                    VStack {
                        CartItem()
                            .padding(.horizontal, 20)
                            .padding(.bottom, 18)
                        Divider().frame(height: 0.5).background(.white).opacity(0.5)
                        CartItem()
                            .padding(.horizontal, 20)
                            .padding(.vertical, 18)
                        Divider().frame(height: 0.5).background(.white).opacity(0.5)
                        CartItem()
                            .padding(.horizontal, 20)
                            .padding(.vertical, 18)
                    }
                }
                Spacer().frame(height: 16)
                Text("Your cart qualifies for free shipping")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(.white).opacity(0.6)

                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("242C3Bff").shadow(.inner(color: Color("191E29ff"), radius: 30, x: 4, y: 10)))
                    .padding(.horizontal, 20)
                    .frame(height: 44)
                    .overlay(alignment: .trailing) {
                        BlueIconButton(overlayView: AnyView(Text("Apply")), onClickButton: {}, width: 114)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                VStack(spacing: 10) {
                    TextRowItem(key: "Subtotal:", value: "$6119.99")
                    TextRowItem(key: "Delivery Fee:", value: "$6119.99")
                    TextRowItem(key: "Discount:", value: "$6119.99")

                    Spacer().frame(height: 8)
                    HStack {
                        Text("Total").font(.system(size: 15)).fontWeight(.medium).foregroundColor(.white).opacity(0.87)
                        Spacer()
                        Text("$4,283.99").font(.system(size: 15)).fontWeight(.bold).foregroundColor(Color("38B8EAff"))
                    }
                }.padding(20)

                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("242C3Bff").shadow(.inner(color: Color("191E29ff"), radius: 30, x: 4, y: 10)))
                    .padding(.horizontal, 20)
                    .frame(width: 174, height: 44)
                    .overlay(alignment: .leading) {
                        BlueIconButton(overlayView: AnyView(Image(systemName: "chevron.right")), onClickButton: {}, width: 44)
                    }
                    .overlay {
                        Text("Check out").font(.system(size: 15, weight: .medium)).foregroundColor(.white).opacity(0.6)
                            .padding(.leading, 8)
                    }
            }
        }
        .topBarTitle(title: "My Shopping Cart", onButtonClick: {
            dismiss()
        })
        .enableInjection()
    }
}
