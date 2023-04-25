//
//  AppDelegate.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        App.setupAppearance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = App.createTabBarController()
        tabBarController.delegate = self
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == Tag.campaignCreate.rawValue {
            let campaignCreateVC = CampaignCreateViewController()
            tabBarController.show(campaignCreateVC, sender: nil)
            return false
        }
        
        return true
    }
}
