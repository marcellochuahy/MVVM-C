//
//  PaymentsListTableViewController.swift
//  MVVM-C
//
//  Created by Marcello Chuahy on 14/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class PaymentsListTableViewController: UITableViewController {
  
  // MARK: - Properties
  var typeOfPayment: TypeOfPayment?
  var paymentsDataSource: [PaymentsOfTheDay]?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = typeOfPayment?.rawValue
    setSelfSizingTableViewCells()
  }
  
  // MARK: - Methods
  func setSelfSizingTableViewCells() {
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
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentsListTableViewCell", for: indexPath) as! PaymentListTableViewCell
    
    guard let key = paymentsDataSource?[indexPath.section]?.keys.first else { return cell }
    
    let payments = paymentsDataSource?[indexPath.section]?[key]
    let beneficiary = payments?[indexPath.row].beneficiary
    let monetaryValueToPay = payments?[indexPath.row].monetaryValueToPay ?? 0
    
    cell.beneficiaryLabel.numberOfLines = 0 // <- zero means multiline in this context
    cell.beneficiaryLabel.text = beneficiary
    cell.monetaryValueToPay.text = "\(monetaryValueToPay)"
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let segueDestination = segue.destination
    
    if let destinationNavigationController = segueDestination as? ProofOfPaymentTableViewController {
      
      guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
      guard let key = paymentsDataSource?[indexPath.section]?.keys.first else { return }
      
      let payments = paymentsDataSource?[indexPath.section]?[key]

      destinationNavigationController.monetaryValueToPay = payments?[indexPath.row].monetaryValueToPay ?? 0
      destinationNavigationController.beneficiary = payments?[indexPath.row].beneficiary ?? ""
      
    }
    
  }
  
}

