//
//  AppDelegate.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/20/23.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseCore
import GoogleMaps

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let defaults = UserDefaults.standard
    let googleApiKey = "AIzaSyBkvctfs9kwSFTRfuU9F57T7hCeT76N284"

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let onBoardinghasSeenByUser = defaults.bool(forKey: "HasSeenOnBoarding")
        GMSServices.provideAPIKey(googleApiKey)

        if onBoardinghasSeenByUser {
            let isLoginSuccessfully = defaults.bool(forKey: "isLogin")
            if isLoginSuccessfully {
                window?.rootViewController = BasicInformationViewController.presentHomeVC()
            }else{
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! MainViewController
                window?.rootViewController = UINavigationController(rootViewController: mainVC)
            }

        }else{
            let initVC = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "onboarding") as! OnboardingViewController
            window?.rootViewController = initVC

            print("Show Onboarding")
        }

        self.window?.makeKeyAndVisible()
        
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


}

