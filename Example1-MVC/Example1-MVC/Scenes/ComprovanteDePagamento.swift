//
//  ComprovanteDePagamento.swift
//  Example1-MVC
//
//  Created by Marcello Chuahy on 15/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ComprovanteDePagamento: UITableViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var valorAPagarLabel: UILabel!
  @IBOutlet weak var beneficiarioLabel: UILabel!
  
  // MARK: - Properties
  var valorAPagar: Double?
  var beneficiario: String?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  // MARK: - Methods
  func initialSetup() {
    valorAPagarLabel.text = "R$ \(valorAPagar ?? 0)"
    beneficiarioLabel.numberOfLines = 0
    beneficiarioLabel.text = beneficiario
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 80
  }
  
  // MARK: - Actions
  @IBAction func dismiss(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
}
