//
//  ProofOfPaymentTVC.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol ProofOfPaymentDelegate: class {
  func dismiss()
}

// ProofOfPaymentTVC
class ProofOfPaymentTVC: UITableViewController {
  
  // MARK: - Properties
  weak var coordinator: ProofOfPaymentDelegate?
  var monetaryValue: Double?
  var beneficiary: String?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  // MARK: - Methods
  func setupTableView() {
    
    /// ⚠️ uncomment to enable self sizing cell
    // tableView.rowHeight = UITableView.automaticDimension
    // tableView.estimatedRowHeight = 347
    tableView.separatorStyle = .none
    tableView.register(ProofOfPaymentTVCell.self, forCellReuseIdentifier: "cell")
    
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
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProofOfPaymentTVCell

    /// ⚠️  Before MVVM (comment to enable MVVM)
    // cell.monetaryValueLabel.text = "R$ \(monetaryValue ?? 0)"
    /// ⚠️ After MVVM (uncomment to enable MVVM)
    let viewModelCurrency = ViewModelCurrency(monetaryValue: monetaryValue ?? 0)
    cell.monetaryValueLabel.attributedText = viewModelCurrency.valorAttributedString

    cell.beneficiaryLabel.text = beneficiary
    
    /// ⚠️ uncomment to enable self sizing cell
    // cell.beneficiaryLabel.numberOfLines = 0
    //cell.beneficiaryLabel.adjustsFontForContentSizeCategory = true
    
    return cell
    
  }
  
}

// MARK: - Constructor
extension ProofOfPaymentTVC {
  
  public class func instantiate(coordinator: ProofOfPaymentDelegate?, monetaryValue: Double, beneficiary: String) -> ProofOfPaymentTVC {
    
    let viewController = ProofOfPaymentTVC()
    
    viewController.title = "comprovante"
    viewController.coordinator = coordinator
    viewController.monetaryValue = monetaryValue
    viewController.beneficiary = beneficiary
    
    return viewController
    
  }
  
}
