//
//  TestScreenViewModel.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 22/03/2025.
//

import Combine
import Foundation

class TestScreenViewModel: ObservableObject {
    @Published var user: UserModel = .init(name: "Duclh3", age: 25)
    
    func changeUserName(newName: String) {
        user.name = newName
    }
}
