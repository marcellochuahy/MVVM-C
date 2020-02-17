//
//  ListaDePagamentos.swift
//  Example1-MVC
//
//  Created by Marcello Chuahy on 14/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ListaDePagamentos: UITableViewController {
  
  // MARK: - Properties
  var tipoDePagamento: TipoDePagamento?
  var paymentsDataSource: [PagamentosDoDia]?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  // MARK: - Methods
  func initialSetup() {
    title = tipoDePagamento?.rawValue
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 80
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return paymentsDataSource?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return paymentsDataSource?[section]?.keys.first
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let key = paymentsDataSource?[section]?.keys.first else { return 0 }
    let payments = paymentsDataSource?[section]?[key] ?? []
    return payments.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "CelulaDaListaDePagamentos", for: indexPath) as! CelulaDaListaDePagamentos
    
    guard let key = paymentsDataSource?[indexPath.section]?.keys.first else { return cell }
    
    let payments     = paymentsDataSource?[indexPath.section]?[key]
    let beneficiario = payments?[indexPath.row].beneficiario
    let valorAPagar  = payments?[indexPath.row].valorAPagar ?? 0
    
    cell.beneficiarioLabel.numberOfLines = 0
    cell.beneficiarioLabel.text = beneficiario
    cell.valorAPagarLabel.text  = "\(valorAPagar)"
    
    return cell
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let segueDestination = segue.destination
    
    if let destinationNavigationController = segueDestination as? UINavigationController,
      let targetController = destinationNavigationController.topViewController as? ComprovanteDePagamento {
      
      guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
      guard let key    = paymentsDataSource?[indexPath.section]?.keys.first else { return }
      let payments     = paymentsDataSource?[indexPath.section]?[key]
      let beneficiario = payments?[indexPath.row].beneficiario ?? ""
      let valorAPagar  = payments?[indexPath.row].valorAPagar ?? 0
      targetController.valorAPagar = valorAPagar
      targetController.beneficiario = beneficiario
      
    }
    
  }
  
}
