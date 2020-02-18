//
//  ListaDePagamentos.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol ListaDePagamentosDelegate: class {
  func pagarBoleto(indexPath: IndexPath)
}

class ListaDePagamentos: UITableViewController {
  
  // MARK: - Properties
  weak var coordinator: ListaDePagamentosDelegate?
  var tipoDePagamento: TipoDePagamento?
  var paymentsDataSource: [PagamentosDoDia]?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  // MARK: - Methods
  func setupTableView() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 80
    tableView.backgroundColor = UIColor.CustomStyle.white
    tableView.register(CelulaDaListaDePagamentos.self, forCellReuseIdentifier: "cell")
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
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CelulaDaListaDePagamentos
    
    guard let key = paymentsDataSource?[indexPath.section]?.keys.first else { return cell }
    
    let payments     = paymentsDataSource?[indexPath.section]?[key]
    let beneficiario = payments?[indexPath.row].beneficiario
    let valorAPagar  = payments?[indexPath.row].valorAPagar ?? 0
    
    cell.beneficiarioLabel.numberOfLines = 0
    cell.beneficiarioLabel.text = beneficiario
    cell.valorAPagarLabel.text  = "\(valorAPagar)"
    cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: false)

    coordinator?.pagarBoleto(indexPath: indexPath)
    
  }
  
}

// MARK: - Constructor
extension ListaDePagamentos {
  public class func instantiate(
    
    delegate: ListaDePagamentosDelegate?,
    tipoDePagamento: TipoDePagamento?,
    paymentsDataSource: [PagamentosDoDia]?
  )
    -> ListaDePagamentos
  {
    let viewController = ListaDePagamentos()
    viewController.coordinator = delegate
    viewController.title = "pagamentos \(tipoDePagamento?.rawValue ?? "")"
    viewController.paymentsDataSource = paymentsDataSource

    return viewController
  }
}

