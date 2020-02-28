//
//  TabBarController.swift
//  MVVMC-Final
//
//  Created by Marcello Chuahy on 19/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  let vc1 = PaymentsCenterTableViewController()
  let vc2 = BlankViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    vc1.tabBarItem = UITabBarItem(title:         "tab1",
                                  image:         UIImage(named: "walletOutline"),
                                  selectedImage: UIImage(named: "walletFilled"))
    
    vc2.tabBarItem = UITabBarItem(title:         "tab2",
                                  image:         UIImage(named: "questionMarkOutline"),
                                  selectedImage: UIImage(named: "questionMarkFilled"))
    
    let navigationController1 = UINavigationController(rootViewController: vc1)
    let navigationController2 = UINavigationController(rootViewController: vc2)
    
    viewControllers = [navigationController1, navigationController2]
    
    tabBar.barTintColor = UIColor.CustomStyle.lightOrange
    tabBar.tintColor = .white
    tabBar.unselectedItemTintColor = UIColor.CustomStyle.whiteAlpha50
    
  }
  
}
