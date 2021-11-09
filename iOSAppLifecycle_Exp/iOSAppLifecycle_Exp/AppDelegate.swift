//
//  AppDelegate.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/7/21.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // SHAK: Properties
    
    // SHAK: Functions
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
}

extension AppDelegate {
    // SHAK: Properties
    static let stateKey = "persistent_state_key"
    
    // SHAK: Functions
    func retriveState() -> State {
        let storedState = UserDefaults.standard.data(forKey: Self.stateKey).flatMap({ try? JSONEncoder().decode(State.self) })
    }
    
    func store(state: State) {
        guard let stateData = try? JSONEncoder().encode(state) else { return }
        UserDefaults.standard.setValue(stateData, forKey: Self.stateKey)
    }
}

