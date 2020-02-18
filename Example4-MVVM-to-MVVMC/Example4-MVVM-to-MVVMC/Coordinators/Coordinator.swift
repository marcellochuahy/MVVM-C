//
//  Coordinator.swift
//  Example4-MVVM-to-MVVMC
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol Coordinator: class {
  
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  
  func start()
  
}
