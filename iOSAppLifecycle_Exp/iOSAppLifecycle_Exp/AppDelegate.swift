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
    var window: UIWindow?
    var state: State! {
        didSet {
            self.store(state: self.state)
            (self.window?.rootViewController as? ViewController)?.state = state
        }
    }
    
    // SHAK: Functions
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        self.window?.rootViewController = ViewController(state: self.state)
        self.window?.rootViewController?.view.backgroundColor = .purple
        self.window?.makeKeyAndVisible()
        self.updateState(with: application, event: .appDidFinishLaunching)
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.state = self.retrieveState()
            let event = Event(with: application, event: .appWillFinishLaunching)
            self.state = self.state.byAppending(event: event)
            return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.updateState(with: application, event: .appWillTerminate)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        self.updateState(with: application, event: .appDidBecomeActive)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        self.updateState(with: application, event: .appWillResignActive)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        self.updateState(with: application, event: .appDidEnterBackground)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.updateState(with: application, event: .appWillEnterForeground)
    }
}

extension AppDelegate {
    // SHAK: Properties
    static let stateKey = "persistent_state_key"
    
    // SHAK: Functions
    func retrieveState() -> State {
        let storedState = UserDefaults.standard.data(forKey: Self.stateKey).flatMap {
            try? JSONDecoder().decode(State.self, from: $0)
        }
        guard let state = storedState else { return State() }
        return state
    }
    
    func store(state: State) {
        guard let stateData = try? JSONEncoder().encode(state) else { return }
        UserDefaults.standard.setValue(stateData, forKey: Self.stateKey)
    }
    
    fileprivate func updateState(with application: UIApplication, event kind: Event.Kind) {
        let event = Event(with: application, event: kind)
        self.state = self.state.byAppending(event: event)
      }
}

