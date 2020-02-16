//
//  JsonPayments.swift
//  Example1-MVC
//
//  Created by Marcello Chuahy on 14/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct WebServiceDecoder: Decodable {
    
    let pagamentosAVencer:   [PagamentosDoDia]
    let pagamentosVencidos:  [PagamentosDoDia]
    let pagamentosExcluidos: [PagamentosDoDia]
    
    let pagamentosAVencerQtdTotal: Int
    let pagamentosAVencerTotalAPagar: Double
    
    let pagamentosVencidosQtdTotal: Int
    let pagamentosVencidosTotalAPagar: Double
    
    let pagamentosExcluidosQtdTotal: Int
    let pagamentosExcluidosTotalAPagar: Double
    
    let paginaAtual: Int
    let ultimaPagina: Int
    
    let statusCode: Int

}
