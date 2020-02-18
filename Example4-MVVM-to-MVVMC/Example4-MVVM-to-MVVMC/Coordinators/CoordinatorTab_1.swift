//
//  CoordinatorTab_1.swift
//  Example4-MVVM-to-MVVMC
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class CoordinatorTab_1: NSObject, Coordinator {
  
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  // MARK: - Properties
  var pagamentosAgrupadosPorTipo = PagamentosAgrupadosPorTipo()
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    
    let viewController = CentralDePagamentos.instantiate(
      
      delegate: self,
      
      pagamentosAVencerQtd          : 0,
      pagamentosAVencerTotalAPagar  : 0,
      pagamentosVencidosQtd         : 0,
      pagamentosVencidosTotalAPagar : 0,
      pagamentosExcluidosQtd        : 0,
      pagamentosExcluidosTotalAPagar: 0
      
    )
    
    viewController.tabBarItem = UITabBarItem(title: "tab1",
                                             image: UIImage(named: "walletOutline"),
                                             selectedImage: UIImage(named: "walletFilled"))
    navigationController.pushViewController(viewController, animated: false)
    navigationController.delegate = self
    
    loadData()
    
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

extension CoordinatorTab_1: CentralDePagamentosDelegate {
  
  // MARK: - Methods
  func loadData() {
    
    guard let url = Bundle.main.url(forResource: "webServicePagamentos", withExtension: "json") else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let data = data {
        
        do {
          
          let json = try JSONDecoder().decode(WebServiceDecoder.self, from: data)
          
          let statusCode = json.statusCode
          
          if statusCode == 200 {
            
            self.pagamentosAgrupadosPorTipo.pagamentosAVencer              = json.pagamentosAVencer
            self.pagamentosAgrupadosPorTipo.pagamentosVencidos             = json.pagamentosVencidos
            self.pagamentosAgrupadosPorTipo.pagamentosExcluidos            = json.pagamentosExcluidos
            
            self.pagamentosAgrupadosPorTipo.pagamentosAVencerQtd           = json.pagamentosAVencerQtdTotal
            self.pagamentosAgrupadosPorTipo.pagamentosAVencerTotalAPagar   = json.pagamentosAVencerTotalAPagar
            self.pagamentosAgrupadosPorTipo.pagamentosVencidosQtd          = json.pagamentosVencidosQtdTotal
            self.pagamentosAgrupadosPorTipo.pagamentosVencidosTotalAPagar  = json.pagamentosVencidosTotalAPagar
            self.pagamentosAgrupadosPorTipo.pagamentosExcluidosQtd         = json.pagamentosExcluidosQtdTotal
            self.pagamentosAgrupadosPorTipo.pagamentosExcluidosTotalAPagar = json.pagamentosExcluidosTotalAPagar
            
            
          } else {
            print("Error to conect API 😤")
          }
          
          DispatchQueue.main.async { [weak self] in

            let viewController = CentralDePagamentos.instantiate(
              
              delegate: self,
            
              pagamentosAVencerQtd          : self?.pagamentosAgrupadosPorTipo.pagamentosAVencerQtd ?? 0,
              pagamentosAVencerTotalAPagar  : self?.pagamentosAgrupadosPorTipo.pagamentosAVencerTotalAPagar ?? 0,
              pagamentosVencidosQtd         : self?.pagamentosAgrupadosPorTipo.pagamentosVencidosQtd ?? 0,
              pagamentosVencidosTotalAPagar : self?.pagamentosAgrupadosPorTipo.pagamentosVencidosTotalAPagar ?? 0,
              pagamentosExcluidosQtd        : self?.pagamentosAgrupadosPorTipo.pagamentosExcluidosQtd ?? 0,
              pagamentosExcluidosTotalAPagar: self?.pagamentosAgrupadosPorTipo.pagamentosExcluidosTotalAPagar ?? 0

            )
            
            viewController.tabBarItem = UITabBarItem(title: "tab1",
                                                     image: UIImage(named: "walletOutline"),
                                                     selectedImage: UIImage(named: "walletFilled"))

            self?.navigationController.viewControllers = [viewController]
            self?.navigationController.delegate = self


          }
          
        } catch let error {
          print(error)
        }
        
      }
      
    }.resume()
    
  }
  
  
  func startNavigationFlow1() {
    let child = CoordinatorTab_1_pagamentosAVencer(navigationController: navigationController,
                                  paymentsDataSource: pagamentosAgrupadosPorTipo.pagamentosAVencer)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
  }
  
  func startNavigationFlow2() {
    let child = CoordinatorTab_1_pagamentosVencidos(navigationController: navigationController,
                                  paymentsDataSource: pagamentosAgrupadosPorTipo.pagamentosVencidos)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
  }
  
  func startNavigationFlow3() {
    let child = CoordinatorTab_1_pagamentosExcluidos(navigationController: navigationController,
                                  paymentsDataSource: pagamentosAgrupadosPorTipo.pagamentosExcluidos)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
  }
  
}

extension CoordinatorTab_1: UINavigationControllerDelegate {
  
  func navigationController(_ navigationController: UINavigationController,
                            didShow viewController: UIViewController, animated: Bool) {
    
    guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
    
    if navigationController.viewControllers.contains(fromViewController) { return }
    
    //        if let viewController1A = fromViewController as? ViewController1A {
    //            childDidFinish(viewController1A.coordinator as? Coordinator)
    //        }
    
    //        if let viewController2A = fromViewController as? ViewController2A {
    //            childDidFinish(viewController2A.coordinator)
    //        }
    
  }
  
}

