//
//  WebServiceDecoder.swift
//  MVVM-C
//
//  Created by Marcello Chuahy on 14/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct WebServiceDecoder: Decodable {
    
    let duePayments:   [PaymentsOfTheDay]
    let overduePayments:  [PaymentsOfTheDay]
    let excludedPayments: [PaymentsOfTheDay]
    
    let numberOfDuePayments: Int
    let totalMonetaryValueOfDuePayments: Double
    
    let numberOfOverduePayments: Int
    let totalMonetaryValueOfOverduePayments: Double
    
    let numberOfExcludedPayments: Int
    let totalMonetaryValueOfExcludedPayments: Double
    
    let currentPage: Int
    let lastPage: Int
    
    let statusCode: Int

}
