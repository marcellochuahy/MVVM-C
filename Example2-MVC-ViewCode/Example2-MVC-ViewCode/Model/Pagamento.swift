//
//  Pagamento.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct Pagamento: Decodable {
  
  let beneficiario: String
  let valorAPagar: Double
  
  init(beneficiario: String, valorAPagar: Double) {
    self.beneficiario = beneficiario
    self.valorAPagar = valorAPagar
  }
  
}
