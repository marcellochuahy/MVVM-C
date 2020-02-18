//
//  ComprovanteDePagamento.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol ComprovanteDePagamentoDelegate: class {
  func dismiss()
}
class ComprovanteDePagamento: UITableViewController {
  
  // MARK: - Properties
  weak var coordinator: ComprovanteDePagamentoDelegate?
  var valorAPagar: Double?
  var beneficiario: String?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //setupLeftBarButton()
    setupTableView()
  }
  
  // MARK: - Methods
  func setupLeftBarButton() {
    
    let leftBarButton  = UIBarButtonItem(title: "fechar", style: .done, target: self, action: #selector(dimissButtonWasPressed))
    self.navigationItem.leftBarButtonItem = leftBarButton
  }
  
  func setupTableView() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 347
    tableView.register(CelulaDoComprovanteDePagamento.self, forCellReuseIdentifier: "cell")
  }
  
  @objc func dimissButtonWasPressed() {
    dismiss(animated: true, completion: nil)
  }
  
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CelulaDoComprovanteDePagamento
    
    cell.valorAPagarLabel.text = "R$ \(valorAPagar ?? 0)"
    cell.beneficiarioLabel.text = beneficiario
    cell.beneficiarioLabel.numberOfLines = 0
    
    return cell
  }
  
  
}

// MARK: - Constructor
extension ComprovanteDePagamento {
  public class func instantiate(
    delegate: ComprovanteDePagamentoDelegate?,
    beneficiario: String,
    valorAPagar: Double
  )
    -> ComprovanteDePagamento
  {
    let viewController = ComprovanteDePagamento()
    viewController.title = "comprovante"
    viewController.coordinator = delegate
    viewController.beneficiario = beneficiario
    viewController.valorAPagar = valorAPagar
    
    return viewController
    
  }
}
//var valorAPagar: Double?
//var beneficiario: String?
//
//
//ComprovanteDePagamento.instantiate(withBeneficiario: beneficiario, andValorAPagar valorAPagar: valorAPagar)
