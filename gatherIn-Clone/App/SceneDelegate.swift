//
//  SceneDelegate.swift
//  gatherIn-Clone
//
//  Created by Mahmoud Hashim on 1/20/23.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let defaults = UserDefaults.standard

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let onBoardinghasSeenByUser = defaults.bool(forKey: "HasSeenOnBoarding")
        
        if onBoardinghasSeenByUser {
            let isLoginSuccessfully = defaults.bool(forKey: "isLogin")
            if isLoginSuccessfully {
                let vc = UIStoryboard(name: "BasicInformation", bundle: nil).instantiateViewController(withIdentifier: "BasicInformationViewController") as! BasicInformationViewController

                window.rootViewController = vc.presentHomeVC()
            }else{
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainView") as! MainViewController
                window.rootViewController = UINavigationController(rootViewController: mainVC)
            }

        }else{
            let initVC = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(identifier: "onboarding") as! OnboardingViewController
            window.rootViewController = initVC

            print("Show Onboarding")
        }
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("Scene Has been Discconect 'SceneDelegate File' ")
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

