//
//  App.swift
//  RaiseUp
//
//  Created by 정호윤 on 2023/04/25.
//

import UIKit

enum Tag: Int {
    case campaignList
    case campaignCreate
    case myPage
}

struct App {
    static func setupAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = .black
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBarAppearance.buttonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    
    static func createTabBarController() -> UITabBarController {
        let campaignListVC = CampaignListViewController()
        let campaignNC = UINavigationController(rootViewController: campaignListVC)
        campaignNC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: Tag.campaignList.rawValue)
        
        let campaignCreateVC = CampaignCreateViewController()
        campaignCreateVC.tabBarItem = UITabBarItem(title: "캠페인 생성", image: UIImage(systemName: "plus.circle"), tag: Tag.campaignCreate.rawValue)
        
        let myPageVC = MyPageViewController()
        let myPageNC = UINavigationController(rootViewController: myPageVC)
        myPageNC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person.circle"), tag: Tag.myPage.rawValue)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [campaignNC, campaignCreateVC, myPageNC]
        
        return tabBarController
    }
}

