//
//  DetailScreen.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 07/02/2025.
//

import Inject
import SwiftUI

struct DetailScreen: View {
    @ObserveInjection var redraw
    @Environment(\.dismiss) private var dissmiss
    var detailItem: SaleItem

    var body: some View {
        ZStack {
            Image("bg_detail")
                .resizable()
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                TabView {
                    Image(detailItem.imageUrl).resizable().scaledToFit().frame(width: 300, height: 200)
                    Image(detailItem.imageUrl).resizable().scaledToFit().frame(width: 300, height: 200)
                    Image(detailItem.imageUrl).resizable().scaledToFit().frame(width: 300, height: 200)
                }
                .tabViewStyle(PageTabViewStyle())
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(stops: [
                        .init(color: Color("353F54ff"), location: 0),
                        .init(color: Color("222834ff"), location: 0.6),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .shadow(.drop(color: Color("000000").opacity(0.25), radius: 60)))
                    .stroke(LinearGradient(stops: [
                        .init(color: Color("FFFFFFff"), location: 0),
                        .init(color: Color("000000ff").opacity(0), location: 0.2),
                    ], startPoint: .top, endPoint: .bottom).opacity(0.2), lineWidth: 2)
                    .overlay(alignment: .top) {
                        VStack(alignment: .leading) {
                            HStack {
                                Button {} label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("323B4Fff")
                                            .shadow(.drop(color: Color("38445Aff"), radius: 3, x: -2, y: -2))
                                            .shadow(.drop(color: Color("252B39ff"), radius: 3, x: 5, y: 5)))
                                        .overlay {
                                            LinearGradient(colors: [Color("3CA4EBff"), Color("4286EEff")], startPoint: .leading, endPoint: .trailing).mask {
                                                Text("Description").font(.body).fontWeight(.bold)
                                            }
                                        }
                                        .frame(width: 133, height: 43)
                                }

                                Spacer().frame(width: 30)
                                Button {} label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("28303F")
                                            .shadow(.inner(color: Color("364055ff"), radius: 8, x: -4, y: -4))
                                            .shadow(.inner(color: Color("202633ff"), radius: 8, x: 4, y: 4)))
                                        .overlay {
                                            Text("Specification").font(.body).foregroundColor(.white).opacity(0.6)
                                        }
                                        .frame(width: 133, height: 43)
                                }
                            }
                            .padding(.horizontal, 40)
                            .padding(.top, 32)

                            Spacer().frame(height: 40)
                            Group {
                                Text(detailItem.modelName).fontWeight(.bold)
                                Spacer().frame(height: 10)
                                Text(detailItem.description).font(.caption).foregroundColor(Color("FFFFFFff").opacity(0.6))
                            }
                            .padding(.horizontal, 20)
                            Spacer()
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color("262E3Dff").shadow(.drop(color: Color("1C222Eff"), radius: 10, x: 0, y: -10)))
                                .stroke(LinearGradient(stops: [
                                    .init(color: Color("FFFFFFff"), location: 0),
                                    .init(color: Color("000000ff"), location: 0.8),
                                ], startPoint: .top, endPoint: .bottom).opacity(0.2))
                                .overlay {
                                    HStack {
                                        Text(detailItem.price).font(.title2).foregroundColor(Color("3D9CEAff"))
                                        Spacer()
                                        NavigationLink(destination: CartScreen()) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(
                                                    LinearGradient(colors: [Color("34C8E8ff"), Color("4E4AF2ff")], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                        .shadow(.drop(color: Color("1A1F2Cff"), radius: 60, x: 0, y: 30))
                                                )
                                                .stroke(LinearGradient(colors: [Color("34C8E8ff"), Color("1A1F2Cff")], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.6), lineWidth: 2)
                                                .overlay {
                                                    Text("Add to cart").foregroundColor(.white).font(.subheadline)
                                                }
                                                .frame(width: 160, height: 44)
                                        }
                                    }
                                    .padding(.horizontal, 40)
                                }
                                .frame(height: 104)
                        }
                    }
                    .ignoresSafeArea(.all)
                    .frame(height: 450)
            }
        }
        .background(Color("242C3Bff"))
        .topBarTitle(title: detailItem.modelName, onButtonClick: {
            dissmiss()
        })
        .enableInjection()
    }
}
