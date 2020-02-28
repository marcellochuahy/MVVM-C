//
//  ChildCoordinatorB.swift
//  PaymentsCentral
//
//  Created by Marcello Chuahy on 24/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ChildCoordinatorB: Coordinator {
  
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  weak var parentCoordinator: PaymentsCentralCoordinator?
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let viewController = SceneB.instantiate(delegate: self)
    viewController.coordinator = self
    navigationController.pushViewController(viewController, animated: true)
  }
  
}

extension ChildCoordinatorB: SceneBDelegate {
  
  func doSomething() {
    
    let alertController = UIAlertController( title: "Child Coordinator B", message: "Tudo funcionando aqui.\n\n👍", preferredStyle: .alert)
    let okAction = UIAlertAction( title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    navigationController.present(alertController, animated: true, completion: nil)
    
  }
  
}
