//
//  UINavigationControllerExtensions.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 11/02/2025.
//

import Foundation
import UIKit
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
