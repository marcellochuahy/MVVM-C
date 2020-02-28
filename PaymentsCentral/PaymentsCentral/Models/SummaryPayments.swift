//
//  SummaryPayments.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 22/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct SummaryPayments {
  
  /// Due Payments
  var numberOfDuePayments: Int?
  var totalMonetaryValueOfDuePayments: Double?
  
  /// Overdue Payments
  var numberOfOverduePayments: Int?
  var totalMonetaryValueOfOverduePayments: Double?
  
  /// Excluded Payments
  var numberOfExcludedPayments: Int?
  var totalMonetaryValueOfExcludedPayments: Double?
  
}
