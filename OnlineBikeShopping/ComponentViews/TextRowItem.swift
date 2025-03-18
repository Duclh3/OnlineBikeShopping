//
//  TextRowItem.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 08/02/2025.
//

import SwiftUI

struct TextRowItem: View {
    var key: String
    var value: String
    
    var body: some View {
        HStack {
            Text(key).font(.system(size: 15)).fontWeight(.medium).foregroundColor(.white).opacity(0.87)
            Spacer()
            Text(value).font(.system(size: 15)).fontWeight(.regular).foregroundColor(.white).opacity(0.6)
        }
    }
}

