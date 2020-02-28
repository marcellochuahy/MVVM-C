//
//  CentralDePagamentos.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

public protocol DashboardDelegate: class {
  func startDuePaymentsNavigation()
  func startOverduePaymentsNavigation()
  func startExcludedPaymentsNavigation()
  func startChildNavigation(withOption option: String)
}

class DashboardTVC: UITableViewController {
  
  // MARK: - Properties
  weak var coordinator: DashboardDelegate?

  var summaryPayments = SummaryPayments(numberOfDuePayments: 0,
                                        totalMonetaryValueOfDuePayments: 0,
                                        numberOfOverduePayments: 0,
                                        totalMonetaryValueOfOverduePayments: 0,
                                        numberOfExcludedPayments: 0,
                                        totalMonetaryValueOfExcludedPayments: 0)
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  func setupTableView() {
    tableView.backgroundColor = UIColor.CustomStyle.backgroundGray
    tableView.separatorStyle = .none
    tableView.register(DashboardTVCell.self, forCellReuseIdentifier: "cellForSection0")
    tableView.register(ChildCoordinatorButtonTVCell.self,   forCellReuseIdentifier: "cellForSection1")
  }
  
}

// MARK: - Constructors
extension DashboardTVC {
  
  public class func instantiate(coordinator: DashboardDelegate?, summaryPayments: SummaryPayments) -> DashboardTVC {
    
    let viewController = DashboardTVC()
    
    viewController.coordinator = coordinator
    viewController.summaryPayments = summaryPayments
    viewController.title = "central de pagamentos"
    
    return viewController
  }
  
}

// MARK: - Table view data source
extension DashboardTVC {
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch(section) {
      case 0: return "Single Coordinator Example"
      case 1: return "Child Coordinators Example"
      default: fatalError("Unknown number of sections")
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch(section) {
      case 0: return 3
      case 1: return 1
      default: fatalError("Unknown number of sections")
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch(indexPath.section) {
    case 0: return 100
    case 1: return 120
    default: fatalError("Unknown number of sections")
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch(indexPath.section) {
      
      case 0:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForSection0", for: indexPath) as! DashboardTVCell
        
        switch(indexPath.row) {
          
          case 0:
            
            let numberOfPayments   = summaryPayments.numberOfDuePayments ?? 0
            let totalMonetaryValue = summaryPayments.totalMonetaryValueOfDuePayments ?? 0
            
            /// ⚠️  Before MVVM (comment to enable MVVM)
            // cell.numberOfPayments.text   = String(numberOfPayments)
            // cell.monetaryValueLabel.text = String(totalMonetaryValue)
            
            /// ⚠️ After MVVM (uncomment to enable MVVM)
            let viewModelNumberOfPaymentv = ViewModelNumberOfPayments(TypeOfPayment: .duePayment, numberOfPayments: numberOfPayments)
            let viewModelCurrency         = ViewModelCurrency(monetaryValue: totalMonetaryValue)
            cell.numberOfPayments.attributedText   = viewModelNumberOfPaymentv.quantidadeAttributedString
            cell.monetaryValueLabel.attributedText = viewModelCurrency.valorAttributedString
            
            cell.leftBarView.backgroundColor = UIColor.CustomStyle.yellow
            
            return cell
            
          case 1:
            
            let numberOfPayments   = summaryPayments.numberOfOverduePayments ?? 0
            let totalMonetaryValue = summaryPayments.totalMonetaryValueOfOverduePayments ?? 0
            
            /// ⚠️  Before MVVM (comment to enable MVVM)
            cell.numberOfPayments.text   = String(numberOfPayments)
            cell.monetaryValueLabel.text = String(totalMonetaryValue)
            
            /// ⚠️ After MVVM (uncomment to enable MVVM)
            // let viewModelNumberOfPaymentv = ViewModelNumberOfPayments(TypeOfPayment: .duePayment, numberOfPayments: numberOfPayments)
            // let viewModelCurrency         = ViewModelCurrency(monetaryValue: totalMonetaryValue)
            // cell.numberOfPayments.attributedText   = viewModelNumberOfPaymentv.quantidadeAttributedString
            // cell.monetaryValueLabel.attributedText = monetaryValueLabel.valorAttributedString
            
            cell.leftBarView.backgroundColor = UIColor.CustomStyle.purple
            
            return cell
            
          case 2:
            
            let numberOfPayments   = summaryPayments.numberOfExcludedPayments ?? 0
            let totalMonetaryValue = summaryPayments.totalMonetaryValueOfExcludedPayments ?? 0
            
            /// ⚠️  Before MVVM (comment to enable MVVM)
            cell.numberOfPayments.text   = String(numberOfPayments)
            cell.monetaryValueLabel.text = String(totalMonetaryValue)
            
            /// ⚠️ After MVVM (uncomment to enable MVVM)
            // let viewModelNumberOfPaymentv = ViewModelNumberOfPayments(TypeOfPayment: .duePayment, numberOfPayments: numberOfPayments)
            // let viewModelCurrency         = ViewModelCurrency(monetaryValue: totalMonetaryValue)
            // cell.numberOfPayments.attributedText   = viewModelNumberOfPaymentv.quantidadeAttributedString
            // cell.monetaryValueLabel.attributedText = viewModelCurrency.valorAttributedString
            
            cell.leftBarView.backgroundColor = UIColor.CustomStyle.darkRed
            
            return cell
            
          default: fatalError("Unknown row in section 0")
          
        }
      
      case 1:
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForSection1", for: indexPath) as! ChildCoordinatorButtonTVCell
      
        cell.delegate = self
        
        return cell
      
      default: fatalError("Unknown section")
      
    }
  
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: false)

    switch(indexPath.section) {
      
      case 0:
        
        switch indexPath.row {
        case 0: coordinator?.startDuePaymentsNavigation()
        case 1: coordinator?.startOverduePaymentsNavigation()
        case 2: coordinator?.startExcludedPaymentsNavigation()
        default: fatalError("Unknown row in section 0")
        }
        
      default: fatalError("Unknown section")
      
    }

  }
  
}

extension DashboardTVC: ChildCoordinatorButtonDelegate {

  func startButtonANavigation() { coordinator?.startChildNavigation(withOption: "A") }
  func startButtonBNavigation() { coordinator?.startChildNavigation(withOption: "B") }
  func startButtonCNavigation() { coordinator?.startChildNavigation(withOption: "C") }
  
}

