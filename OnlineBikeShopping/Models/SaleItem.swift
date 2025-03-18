//
//  SaleItem.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 06/02/2025.
//

import Foundation

struct SaleItem: Identifiable {
    var id: String = UUID().uuidString
    var name: String = ""
    var modelName: String = ""
    var price: String = ""
    var isFavourite: Bool = false
    var imageUrl: String = ""
    var description: String = ""
}
