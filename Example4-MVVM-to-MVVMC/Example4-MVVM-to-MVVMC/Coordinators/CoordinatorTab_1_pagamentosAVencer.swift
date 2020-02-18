//
//  CoordinatorTab_1A.swift
//  Example4-MVVM-to-MVVMC
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class CoordinatorTab_1_pagamentosAVencer: Coordinator {
  
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  var paymentsDataSource: [PagamentosDoDia]?
  
  weak var parentCoordinator: CoordinatorTab_1?
  
  init(navigationController: UINavigationController, paymentsDataSource: [PagamentosDoDia]?) {
    self.navigationController = navigationController
    self.paymentsDataSource = paymentsDataSource
  }

  func start() {
    let viewController = ListaDePagamentos.instantiate(delegate: self,
                                                       tipoDePagamento: .pagamentosAVencer,
                                                       paymentsDataSource: paymentsDataSource)
    viewController.coordinator = self
    navigationController.pushViewController(viewController, animated: true)
  }
  
}


//extension CoordinatorTab_1_pagamentosAVencer: ListaDePagamentosDelegate {
//
//  func pagarBoleto(indexPath: IndexPath) {
//
//  }
//
//  private func navigateToDetailVC(withID id: String) {
////    let viewController = ViewController1B.instantiate(id: id)
////    viewController.coordinator = self
////    navigationController.pushViewController(viewController, animated: true)
//  }
//
//}

extension CoordinatorTab_1_pagamentosAVencer: ListaDePagamentosDelegate {
  
  func pagarBoleto(indexPath: IndexPath) {
    
    guard let key = paymentsDataSource?[indexPath.section]?.keys.first,
      let todosOsPagamentos = paymentsDataSource?[indexPath.section],
      let pagamentosPorDiaSelecionado = todosOsPagamentos[key] else { return }
    
    let pagamentoSelecionado = pagamentosPorDiaSelecionado[indexPath.row]
    let beneficiario = pagamentoSelecionado.beneficiario
    let valorAPagar  = pagamentoSelecionado.valorAPagar
    
    navigateToComprovanteDePagamento(withBeneficiario: beneficiario, andValorAPagar: valorAPagar)
    
  }
  
  private func navigateToComprovanteDePagamento(withBeneficiario beneficiario: String, andValorAPagar valorAPagar: Double) {
    let viewController = ComprovanteDePagamento.instantiate(delegate: self, beneficiario: beneficiario, valorAPagar: valorAPagar)
    navigationController.pushViewController(viewController, animated: true)
  }
  
}

extension CoordinatorTab_1_pagamentosAVencer: ComprovanteDePagamentoDelegate {
  func dismiss() {
    //
  }
}


