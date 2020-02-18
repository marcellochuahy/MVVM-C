//
//  CentralDePagamentos.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

public protocol CentralDePagamentosDelegate: class {
  func startNavigationFlow1()
  func startNavigationFlow2()
  func startNavigationFlow3()
}

class CentralDePagamentos: UITableViewController {
  
  // ⚠️
  // MARK: Properties
  weak var coordinator: CentralDePagamentosDelegate?
  
  var pagamentosAVencerQtd: Int?
  var pagamentosAVencerTotalAPagar: Double?
  var pagamentosVencidosQtd: Int?
  var pagamentosVencidosTotalAPagar: Double?
  var pagamentosExcluidosQtd: Int?
  var pagamentosExcluidosTotalAPagar: Double?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  func setupTableView() {
    tableView.backgroundColor = UIColor.CustomStyle.backgroundGray
    tableView.separatorStyle = .none
    tableView.register(CelulaDaCentralDePagamentos.self, forCellReuseIdentifier: "cell")
  }
  
}

// MARK: - Constructors
extension CentralDePagamentos {
  
  public class func instantiate
  (
    delegate: CentralDePagamentosDelegate?,
    pagamentosAVencerQtd: Int,
    pagamentosAVencerTotalAPagar: Double,
    pagamentosVencidosQtd: Int,
    pagamentosVencidosTotalAPagar: Double,
    pagamentosExcluidosQtd: Int,
    pagamentosExcluidosTotalAPagar: Double
  ) -> CentralDePagamentos
  {
    let viewController = CentralDePagamentos()
    
    viewController.coordinator = delegate
    viewController.pagamentosAVencerQtd = pagamentosAVencerQtd
    viewController.pagamentosAVencerTotalAPagar = pagamentosAVencerTotalAPagar
    viewController.pagamentosVencidosQtd = pagamentosVencidosQtd
    viewController.pagamentosVencidosTotalAPagar = pagamentosVencidosTotalAPagar
    viewController.pagamentosExcluidosQtd = pagamentosExcluidosQtd
    viewController.pagamentosExcluidosTotalAPagar = pagamentosExcluidosTotalAPagar

    viewController.title = "central de pagamentos"
    return viewController
  }
  
}

// MARK: - Table view data source
extension CentralDePagamentos {
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch(section) {
    case 0: return 3
    default: fatalError("Unknown number of sections")
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CelulaDaCentralDePagamentos
    
    switch(indexPath.section) {
    case 0:
      switch(indexPath.row) {

      case 0:
        
        let viewModel = ViewModelQuantidadeDePagamentos(
          tipoDePagamento: .pagamentosAVencer,
          quantidadeTotal: pagamentosAVencerQtd ?? 0,
          valorTotal: pagamentosAVencerTotalAPagar ?? 0
        )
        
        cell.beneficiarioLabel.attributedText = viewModel.quantidadeAttributedString
        cell.valorAPagarLabel.attributedText = viewModel.valorAttributedString
        cell.leftBarView.backgroundColor = UIColor.CustomStyle.yellow
        
        return cell
        
      case 1:

        let viewModel = ViewModelQuantidadeDePagamentos(
          tipoDePagamento: .pagamentosVencidos,
          quantidadeTotal: pagamentosVencidosQtd ?? 0,
          valorTotal: pagamentosVencidosTotalAPagar ?? 0
        )
        
        cell.beneficiarioLabel.attributedText = viewModel.quantidadeAttributedString
        cell.valorAPagarLabel.attributedText = viewModel.valorAttributedString
        cell.leftBarView.backgroundColor = UIColor.CustomStyle.purple
        
        return cell
        
      case 2:
        
        let viewModel = ViewModelQuantidadeDePagamentos(
          tipoDePagamento: .pagamentosExcluidos,
          quantidadeTotal: pagamentosExcluidosQtd ?? 0,
          valorTotal: pagamentosExcluidosTotalAPagar ?? 0
        )
        
        cell.beneficiarioLabel.attributedText = viewModel.quantidadeAttributedString
        cell.valorAPagarLabel.attributedText = viewModel.valorAttributedString
        cell.leftBarView.backgroundColor = UIColor.CustomStyle.darkRed
        
        return cell
        
      default: fatalError("Unknown row in section 0")
        
      }
    default: fatalError("Unknown section")
    }
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: false)

    switch(indexPath.section) {
    case 0:
      
      switch indexPath.row {
      case 0: coordinator?.startNavigationFlow1()
      case 1: coordinator?.startNavigationFlow2()
      case 2: coordinator?.startNavigationFlow3()
      default: fatalError("Unknown row in section 0")
      }
      
    default: fatalError("Unknown section")
    }

  }
  
}

