//
//  MainScreen.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 05/02/2025.
//

import Inject
import SwiftUI

struct MainScreen: View {
    @ObserveInjection var redraw
    @StateObject var viewmodel: MainScreenViewModel = .init()
    
    let mainCardHeight: CGFloat = 240
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("242C3Bff").ignoresSafeArea(.all)
            VStack {
                Spacer().frame(height: 20)
                MainItemShape(cornerRadius: 20, offsetHeightPercent: 0.1)
                    .fill(
                        LinearGradient(colors: [Color("353F54ff"), Color("222834ff")],
                                       startPoint: .topLeading,
                                       endPoint: .trailing).opacity(0.6)
                            .shadow(.drop(color: Color("3B475Fff").opacity(0.5), radius: 60, x: 0, y: -60))
                            .shadow(.drop(color: Color("10141Cff"), radius: 60, x: 0, y: 20))
                    )
                    .stroke(LinearGradient(colors: [Color("FFFFFFff").opacity(0.2), Color("000000ff").opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                    .overlay {
                        ZStack {
                            Image("xedap").resizable().scaledToFit()
                            Text("30% Off")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                .offset(x: 20, y: 0)
                                .foregroundColor(.white)
                                .opacity(0.6)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 15)
                    }
                    .frame(width: 350, height: mainCardHeight)
                
                Spacer().frame(height: 20)
                HStack {
                    Button {} label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(colors: [Color("34C8E8ff"), Color("4E4AF2ff")], startPoint: .topLeading, endPoint: .bottomTrailing)
                                .shadow(.drop(color: Color("2B3445ff").opacity(0.5), radius: 30, x: 0, y: -20))
                                .shadow(.drop(color: Color("10141Cff"), radius: 30, x: 0, y: 30))
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        LinearGradient(
                                            colors: [Color("FFFFFFff"), Color("000000ff").opacity(0.84), Color("000000ff")],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                    .opacity(0.2)
                                    .overlay {
                                        Text("All")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                    }
                            }
                        
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    Button {} label: {
                        SmallRectangleItem(stringImage: "icon_1")
                            .offset(x: 0, y: mainCardHeight * -0.03)
                    }
                    Spacer()
                    Button {} label: {
                        SmallRectangleItem(stringImage: "icon_2")
                            .offset(x: 0, y: mainCardHeight * -0.06)
                    }
                    Spacer()
                    Button {} label: {
                        SmallRectangleItem(stringImage: "icon_3")
                            .offset(x: 0, y: mainCardHeight * -0.09)
                    }
                    Spacer()
                    Button {} label: {
                        SmallRectangleItem(stringImage: "icon_4")
                            .offset(x: 0, y: mainCardHeight * -0.12)
                    }
                }
                Spacer().frame(height: 30)
                if viewmodel.isLoading {
                    ProgressView()
                } else if let error = viewmodel.errorMessage {
                    VStack {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button("Retry") {
                            viewmodel.getData()
                        }
                        .font(.body)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    getListItem()
                        .background(.clear)
                }
            }
            .padding(.horizontal, 20)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                BlueIconButton(overlayView: AnyView(Image(systemName: "magnifyingglass"))) {}
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Text("Choose your Bike").fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        
        .enableInjection()
    }
    
    private func getListItem() -> ScrollView<HStack<ForEach<[SaleItem], String, some View>>> {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(viewmodel.saleItems) { item in
                    NavigationLink {
                        DetailScreen(detailItem: item)
                    } label: {
                        ItemShape(cornerRadius: 20)
                            .fill(LinearGradient(colors: [Color("353F54ff"), Color("222834ff")], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .stroke(LinearGradient(colors: [Color("FFFFFFff"), Color("000000ff").opacity(0.84), Color("000000ff")], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.2),
                                    lineWidth: 2)
                            .overlay {
                                VStack(alignment: .leading) {
                                    Image(item.imageUrl).resizable().scaledToFit()
                                    Spacer().frame(height: 20)
                                    Text(item.modelName).font(.caption)
                                    Text(item.name).font(.subheadline).fontWeight(.bold)
                                    Text(item.price).font(.caption2)
                                }
                                .padding(.horizontal, 20)
                            }
                            .overlay(alignment: .topTrailing) {
                                Button {
                                    viewmodel.toggleFavorite(for: item)
                                } label: {
                                    Image(item.isFavourite ? "blue_heart" : "heart").padding([.trailing, .top], 15)
                                }
                            }
                            .foregroundColor(.white)
                            .frame(width: 165, height: 250)
                    }
                }
            }
        }
    }
}
