//
//  ProofOfPaymentTableViewController.swift
//  MVVM-C
//
//  Created by Marcello Chuahy on 15/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ProofOfPaymentTableViewController: UITableViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var monetaryValueToPayLabel: UILabel!
  @IBOutlet weak var beneficiaryLabel: UILabel!
  
  // MARK: - Properties
  var monetaryValueToPay: Double?
  var beneficiary: String?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  // MARK: - Methods
  func initialSetup() {
    monetaryValueToPayLabel.text = "R$ \(monetaryValueToPay ?? 0)"
    beneficiaryLabel.text = beneficiary
    beneficiaryLabel.numberOfLines = 0
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 80
  }
  
}
