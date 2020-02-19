//
//  TypeOfPayment.swift
//  MVVM-C
//
//  Created by Marcello Chuahy on 15/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

enum TypeOfPayment: String {
    case duePayments = "pagamentos a vencer"
    case overduePayments = "pagamentos vencidos"
    case excludedPayments = "pagamentos excluídos"
}
