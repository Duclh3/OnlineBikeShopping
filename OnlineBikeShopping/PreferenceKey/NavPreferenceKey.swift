//
//  NavTitlePreferenceKey.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 11/02/2025.
//

import Foundation
import SwiftUI

struct NavTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        defaultValue = nextValue()
    }
}
