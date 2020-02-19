//
//  PaymentsGroupedByType.swift
//  MVVM-C
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct PaymentsGroupedByType {
  
  var duePayments:   [PaymentsOfTheDay] = []
  var overduePayments:  [PaymentsOfTheDay] = []
  var excludedPayments: [PaymentsOfTheDay] = []
  
}
