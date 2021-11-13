//
//  SceneDelegate.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/7/21.
//

import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // SHAK: Properties
    var window: UIWindow?
    var defaults: UserDefaults?

    // SHAK: Functions
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        if defaults?.string(forKey: "TerminationKey") != nil && connectionOptions.notificationResponse != nil {
            let rootViewController = UINavigationController(rootViewController: ViewController())
            window?.rootViewController =  rootViewController
            window?.makeKeyAndVisible()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notify User"), object: nil, userInfo: connectionOptions.notificationResponse?.notification.request.content.userInfo)
            }
        }
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.makeKeyAndVisible()
//        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        self.window?.overrideUserInterfaceStyle = UserDefaultManager.shared.theme.getUserInterfaceStyle()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

