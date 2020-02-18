//
//  TabBarController.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
  let vc1 = CentralDePagamentos()
  let vc2 = OutroViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    /// View controllers
    
    vc1.tabBarItem = UITabBarItem(title:         "tab1",
                                  image:         UIImage(named: "walletOutline"),
                                  selectedImage: UIImage(named: "walletFilled"))
    
    vc2.tabBarItem = UITabBarItem(title:         "tab2",
                                  image:         UIImage(named: "questionMarkOutline"),
                                  selectedImage: UIImage(named: "questionMarkFilled"))
    
    /*
    Sample using SystemItem:
     
    vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
    */
    
    // ----------------------------------------------------------------------------------------------------
    
    /// Navigation controllers
    let navigationController1 = UINavigationController(rootViewController: vc1)
    let navigationController2 = UINavigationController(rootViewController: vc2)
    
    // ----------------------------------------------------------------------------------------------------
    
    /// Tab bar View Controllers:
    viewControllers = [navigationController1, navigationController2]

    /// Tab bar background color
    tabBar.barTintColor = UIColor.CustomStyle.lightOrange
    
    /// Tab bar icons color
    tabBar.tintColor = .white
    tabBar.unselectedItemTintColor = UIColor.CustomStyle.whiteAlpha50

  }

}

