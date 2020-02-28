//
//  AppDelegate.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 21/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupWindow()
    return true
  }

}

extension AppDelegate {
  
  func setupWindow() {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = TabBarController()
    
    self.window = window
    window.makeKeyAndVisible()
    
  }
  
}
