//
//  CoordinatorTab_2.swift
//  Example4-MVVM-to-MVVMC
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class CoordinatorTab_2: NSObject, Coordinator {
  
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let viewController = OutroViewController()
    viewController.tabBarItem = UITabBarItem(title: "tab2", image: UIImage(named: "questionMarkOutline"), selectedImage: UIImage(named: "questionMarkFilled"))
    navigationController.pushViewController(viewController, animated: false)
  }
  
  func childDidFinish(_ child: Coordinator?) {
    for (index, coordinator) in childCoordinators.enumerated() {
      if coordinator === child {
        childCoordinators.remove(at: index)
        break
      }
    }
  }
  
}
