//
//  PaymentsCenterTableViewController.swift
//  MVVM-C
//
//  Created by Marcello Chuahy on 14/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class PaymentsCenterTableViewController: UITableViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var numberOfDuePaymentsLabel: UILabel!
  @IBOutlet weak var totalMonetaryValueOfDuePaymentsLabel: UILabel!
  
  @IBOutlet weak var numberOfOverduePaymentsLabel: UILabel!
  @IBOutlet weak var totalMonetaryValueOfOverduePaymentsLabel: UILabel!
  
  @IBOutlet weak var numberOfExcludedPaymentsLabel: UILabel!
  @IBOutlet weak var totalMonetaryValueOfExcludedPaymentsLabel: UILabel!
  
  // MARK: - Properties
  var paymentsGroupedByType = PaymentsGroupedByType()
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
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
            self.paymentsGroupedByType.duePayments = json.duePayments
            self.paymentsGroupedByType.overduePayments = json.overduePayments
            self.paymentsGroupedByType.excludedPayments = json.excludedPayments
          } else {
            print("Error to conect API 😤")
          }
          
          DispatchQueue.main.async { [weak self] in
            
            self?.numberOfDuePaymentsLabel.text = "\(json.numberOfDuePayments) pagamentos a vencer"
            self?.totalMonetaryValueOfDuePaymentsLabel.text = "R$ \(json.totalMonetaryValueOfDuePayments)"
            
            self?.numberOfOverduePaymentsLabel.text = "\(json.numberOfOverduePayments) pagamentos vencidos"
            self?.totalMonetaryValueOfOverduePaymentsLabel.text = "R$ \(json.totalMonetaryValueOfOverduePayments)"
            
            self?.numberOfExcludedPaymentsLabel.text = "\(json.numberOfExcludedPayments) pagamentos excluídos"
            self?.totalMonetaryValueOfExcludedPaymentsLabel.text = "R$ \(json.totalMonetaryValueOfExcludedPayments)"
          
          }
          
        } catch let error {
          print(error)
        }
        
      }
      
    }.resume()
    
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let destinationViewController = segue.destination as? PaymentsListTableViewController {
      
      switch segue.identifier {

      case "duePaymentsSegue":
        destinationViewController.typeOfPayment = .duePayments
        destinationViewController.paymentsDataSource = paymentsGroupedByType.duePayments
        
      case "overduePaymentsSegue":
        destinationViewController.typeOfPayment = .overduePayments
        destinationViewController.paymentsDataSource = paymentsGroupedByType.overduePayments
        
      case "excludedPaymentsSegue":
        destinationViewController.typeOfPayment = .excludedPayments
        destinationViewController.paymentsDataSource = paymentsGroupedByType.excludedPayments
        
      default: break
        
      }
      
    }
    
  }
  
}
