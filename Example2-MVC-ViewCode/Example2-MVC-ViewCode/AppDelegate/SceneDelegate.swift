//
//  SceneDelegate.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
//    window = UIWindow(frame: UIScreen.main.bounds)
//    window?.rootViewController = UINavigationController(rootViewController: YourTabBarController())
//    window?.makeKeyAndVisible()

    // OK
    //    window = UIWindow(windowScene: windowScene)
    //    window?.rootViewController = TabBarController()
    //    window?.makeKeyAndVisible()
    
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = TabBarController()
    window?.makeKeyAndVisible()
    
  }

}



//extension SceneDelegate {
//
//  func setupForNavigationViewController() {
//
//    // ⚠️ Descomentar caso não esteja usando Tab Bar Navigation
//    // let navController = UINavigationController()
//    // coordinator = MainCoordinator(navigationController: navController)
//    // coordinator?.start()
//    // window = UIWindow(frame: UIScreen.main.bounds)
//    // window?.rootViewController = navController
//    // window?.makeKeyAndVisible()
//
//  }
//
//  func addTabBarController() {
//    //    window = UIWindow(frame: UIScreen.main.bounds)
//    //    window?.rootViewController = MainTabBarController()
//    //    window?.makeKeyAndVisible()
//  }
//
//}








