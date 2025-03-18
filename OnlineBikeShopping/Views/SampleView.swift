//
//  SampleView.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 06/02/2025.
//

import SwiftUI

struct SampleView: View {
    var color: Color
    var content: String

    var body: some View {
        ZStack {
            color.ignoresSafeArea(.all)
            Text("Screen \(content)")
        }
    }
}
