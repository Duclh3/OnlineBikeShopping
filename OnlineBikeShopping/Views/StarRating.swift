//
//  StarRating.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 22/03/2025.
//

import Foundation
import SwiftUI

struct StarRating: View {
    @State var rating: Int
    private let maxRating = 5


    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { value in
                Image(systemName: "star")
                    .symbolVariant(value <= rating ? .fill : .none)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        if value != rating {
                            rating = value
                        } else {
                            rating = 0
                        }
                    }
            }
        }
    }
}
