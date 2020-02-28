//
//  Pagamento.swift
//  Example of MVVM-C Pattern
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct Payment: Decodable {
  
  let beneficiary: String
  let monetaryValue: Double
  
  init(beneficiary: String, monetaryValue: Double) {
    self.beneficiary = beneficiary
    self.monetaryValue = monetaryValue
  }
  
}
