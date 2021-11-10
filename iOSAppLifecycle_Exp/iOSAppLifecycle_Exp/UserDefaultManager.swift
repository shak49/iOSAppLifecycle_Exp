//
//  UserDefaultManager.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/10/21.
//

import Foundation


struct UserDefaultManager {
    static var shared: UserDefaultManager = UserDefaultManager()
    var theme: Theme {
        get {
            return Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .device
        } set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}
