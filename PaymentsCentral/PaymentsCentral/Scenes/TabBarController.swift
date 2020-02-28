//
//  TabBarController.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  let paymentsCentralCoordinator = PaymentsCentralCoordinator(navigationController: UINavigationController())
  let vc2 = OtherViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    paymentsCentralCoordinator.start()
    setUpVC2TabBarItem()
    setUpViewControllers()
    setUpTabBarStyle()
  }
  
  func setUpVC2TabBarItem() {
    vc2.tabBarItem = UITabBarItem(title:         "tab2",
                                  image:         UIImage(named: "questionMarkOutline"),
                                  selectedImage: UIImage(named: "questionMarkFilled"))
  }
  
  func setUpViewControllers() {
    viewControllers = [paymentsCentralCoordinator.navigationController, vc2]
  }
  
  func setUpTabBarStyle() {
    tabBar.barTintColor = UIColor.CustomStyle.lightOrange
    tabBar.tintColor = .white
    tabBar.unselectedItemTintColor = UIColor.CustomStyle.whiteAlpha50
  }

}
