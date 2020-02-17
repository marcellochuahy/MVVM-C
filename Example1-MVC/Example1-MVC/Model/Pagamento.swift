//
//  Payment.swift
//  Example1-MVC
//
//  Created by Marcello Chuahy on 14/02/20.
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
