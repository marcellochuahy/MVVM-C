//
//  CentralDePagamentos.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class CentralDePagamentos: UITableViewController {
  
  // MARK: - Properties
  var pagamentosAgrupadosPorTipo = PagamentosAgrupadosPorTipo()
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "central de pagamentos"
    loadData()
    setupTableView()
  }
  
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
            self?.tableView.reloadData()
          }
          
        } catch let error {
          print(error)
        }
        
      }
      
    }.resume()
    
  }
  
  func setupTableView() {
    tableView.backgroundColor = UIColor.CustomStyle.backgroundGray
    tableView.separatorStyle = .none
    tableView.register(CelulaDaCentralDePagamentos.self, forCellReuseIdentifier: "cell")
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
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    /*
     switch(section) {
     case 0: return "Section 0"
     default: fatalError("Unknown section")
     }
     */
    return nil
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

        // ----------------------------------------------------------------------------------------------
        /*
        // Refatoração:
        cell.beneficiarioLabel.text = "\(pagamentosAgrupadosPorTipo.pagamentosAVencerQtd ?? 0) pagamentos a vencer"
        cell.valorAPagarLabel.text = "R$ \(pagamentosAgrupadosPorTipo.pagamentosAVencerTotalAPagar ?? 0)"
        */
        
        let viewModel = ViewModelQuantidadeDePagamentos(
          tipoDePagamento: .pagamentosAVencer,
          quantidadeTotal: pagamentosAgrupadosPorTipo.pagamentosAVencerQtd ?? 0,
          valorTotal: pagamentosAgrupadosPorTipo.pagamentosAVencerTotalAPagar ?? 0
        )
        
        cell.beneficiarioLabel.attributedText = viewModel.quantidadeAttributedString
        cell.valorAPagarLabel.attributedText  = viewModel.valorAttributedString
        
        // Abaixo permanece igual:
        
        cell.leftBarView.backgroundColor = UIColor.CustomStyle.yellow
        return cell

        // ----------------------------------------------------------------------------------------------
        
      case 1:
        
        // Refatorado:
        
        let viewModel = ViewModelQuantidadeDePagamentos(
          tipoDePagamento: .pagamentosVencidos,
          quantidadeTotal: pagamentosAgrupadosPorTipo.pagamentosVencidosQtd ?? 0,
          valorTotal: pagamentosAgrupadosPorTipo.pagamentosVencidosTotalAPagar ?? 0
        )
        
        cell.beneficiarioLabel.attributedText = viewModel.quantidadeAttributedString
        cell.valorAPagarLabel.attributedText  = viewModel.valorAttributedString
        cell.leftBarView.backgroundColor = UIColor.CustomStyle.purple
        return cell
        
      case 2:
        
        // Não refatorado:
        
        cell.beneficiarioLabel.text = "\(pagamentosAgrupadosPorTipo.pagamentosExcluidosQtd ?? 0) pagamentos excluídos"
        cell.valorAPagarLabel.text = "R$ \(pagamentosAgrupadosPorTipo.pagamentosExcluidosTotalAPagar ?? 0)"
        cell.leftBarView.backgroundColor = UIColor.CustomStyle.darkRed
        return cell
        
      default: fatalError("Unknown row in section 0")
        
      }
    default: fatalError("Unknown section")
    }
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: false)
    
    let destinationViewController = ListaDePagamentos()

    switch(indexPath.section) {
    case 0:
      switch indexPath.row {
        
      case 0:
        destinationViewController.tipoDePagamento    = .pagamentosAVencer
        destinationViewController.paymentsDataSource = pagamentosAgrupadosPorTipo.pagamentosAVencer
        
      case 1:
        destinationViewController.tipoDePagamento    = .pagamentosVencidos
        destinationViewController.paymentsDataSource = pagamentosAgrupadosPorTipo.pagamentosVencidos
        
      case 2:
        destinationViewController.tipoDePagamento    = .pagamentosExcluidos
        destinationViewController.paymentsDataSource = pagamentosAgrupadosPorTipo.pagamentosExcluidos
        
      default: fatalError("Unknown row in section 0")
        
      }
      
      default: fatalError("Unknown section")
    }
 
    navigationController?.pushViewController(destinationViewController, animated: true)
    
  }
  
}

