//
//  ChildCoordinatorA.swift
//  PaymentsCentral
//
//  Created by Marcello Chuahy on 24/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ChildCoordinatorA: Coordinator {
  
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  weak var parentCoordinator: PaymentsCentralCoordinator?
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let viewController = SceneA.instantiate(delegate: self)
    viewController.coordinator = self
    navigationController.pushViewController(viewController, animated: true)
  }
  
}

extension ChildCoordinatorA: SceneADelegate {
  
  func doSomething() {
    
    let alertController = UIAlertController( title: "Child Coordinator A", message: "Tudo funcionando aqui.\n\n👍", preferredStyle: .alert)
    let okAction = UIAlertAction( title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    navigationController.present(alertController, animated: true, completion: nil)
    
  }
  
}
