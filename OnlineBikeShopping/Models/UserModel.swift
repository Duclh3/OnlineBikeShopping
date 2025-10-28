//
//  UserModel.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 22/03/2025.
//

import Foundation

struct UserModel: Codable {
    var name: String
    var age: Int

    mutating func changeName(newValue: String) {
        name = newValue
    }
}
