//
//  Theme.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/10/21.
//

import UIKit


enum Theme: Int {
    case light
    case device
    case dark
    
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .device:
            return .unspecified
        case .dark:
            return .dark
        }
    }
}
