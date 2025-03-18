//
//  NavTitlePreferenceKey.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 11/02/2025.
//

import Foundation
import SwiftUI

struct TitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""

    static func reduce(value: inout String, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct SubTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""

    static func reduce(value: inout String, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct ShowBackButtonPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = true

    static func reduce(value: inout Bool, nextValue: () -> Value) {
        value = nextValue()
    }
}
