//
//  ListaDePagamentos.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol PaymentListDelegate: class {
  func pay(monetaryValue: Double, forBeneficiary beneficiary: String)
}

class PaymentListTVC: UITableViewController {
  
  // MARK: - Properties
  weak var coordinator: PaymentListDelegate?
  var TypeOfPayment: TypeOfPayment?
  var paymentsDataSource: [DayAndPayments]?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  // MARK: - Methods
  func setupTableView() {
    
    /// ⚠️ uncomment to enable self sizing cell
    // tableView.rowHeight = UITableView.automaticDimension
    // tableView.estimatedRowHeight = 80
    tableView.backgroundColor = UIColor.CustomStyle.white
    tableView.register(PaymentListTVCell.self, forCellReuseIdentifier: "cell")
  }

}

// MARK: - Constructor
extension PaymentListTVC {
  
  public class func instantiate(coordinator: PaymentListDelegate?, title: String, paymentsDataSource: [DayAndPayments]?) -> PaymentListTVC {
    
    let viewController = PaymentListTVC()
    
    viewController.coordinator = coordinator
    viewController.title = title
    viewController.paymentsDataSource = paymentsDataSource
    
    return viewController
    
  }
  
}


// MARK: - Table view data source
extension PaymentListTVC {
  
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
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PaymentListTVCell
    
    guard let day      = paymentsDataSource?[indexPath.section]?.keys.first,
          let payments = paymentsDataSource?[indexPath.section]?[day] else { return cell }

    /// ⚠️ uncomment to enable self sizing cell
    // cell.beneficiaryLabel.adjustsFontForContentSizeCategory = true
    // cell.beneficiaryLabel.numberOfLines = 0
    cell.beneficiaryLabel.text = payments[indexPath.row].beneficiary
    
    /// ⚠️  Before MVVM (comment to enable MVVM)
    cell.monetaryValueLabel.text = "\(payments[indexPath.row].monetaryValue)"
    /// ⚠️ After MVVM (uncomment to enable MVVM)
    // let viewModelCurrency = ViewModelCurrency(monetaryValue: payments[indexPath.row].monetaryValue)
    // cell.monetaryValueLabel.attributedText = viewModelCurrency.valorAttributedString

    cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    
    return cell
    
  }
  
  /// a payment was selected to will be payed
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: false)
    
    guard let day      = paymentsDataSource?[indexPath.section]?.keys.first,
          let payments = paymentsDataSource?[indexPath.section]?[day] else { return }
    
    let beneficiary   = payments[indexPath.row].beneficiary
    let monetaryValue = payments[indexPath.row].monetaryValue
    
    coordinator?.pay(monetaryValue: monetaryValue, forBeneficiary: beneficiary)
    
  }
  
}


