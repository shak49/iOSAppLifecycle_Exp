//
//  AppDelegate.swift
//  iOSAppLifecycle_Exp
//
//  Created by Shak Feizi on 11/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let task = application.beginBackgroundTask(withName: "App Will Terminated", expirationHandler: { () -> Void in
            // Do something to stop our background task or the app will be killed
            self.showAlert()
        })
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    }
}

extension AppDelegate {
    func showAlert() {
        let alertController = UIAlertController(title: "App terminated!", message: "Unfortunately, application is terminated", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
    }
}

