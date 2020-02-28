//
//  PaymentsGroupedByType.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct PaymentsGroupedByType {
  
  var duePayment:      [DayAndPayments] = []
  var overduePayment:  [DayAndPayments] = []
  var excludedPayment: [DayAndPayments] = []
  
}
