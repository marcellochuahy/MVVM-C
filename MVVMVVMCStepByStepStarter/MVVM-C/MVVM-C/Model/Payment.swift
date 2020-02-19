//
//  Payment.swift
//  MVVM-C
//
//  Created by Marcello Chuahy on 14/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct Payment: Decodable {
    
    let beneficiary: String
    let monetaryValueToPay: Double
    
    init(beneficiary: String, monetaryValueToPay: Double) {
        self.beneficiary = beneficiary
        self.monetaryValueToPay = monetaryValueToPay
    }
    
}
