//
//  PagamentosAgrupadosPorTipo.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 16/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

struct PagamentosAgrupadosPorTipo {
  
  var pagamentosAVencer:   [PagamentosDoDia] = []
  var pagamentosVencidos:  [PagamentosDoDia] = []
  var pagamentosExcluidos: [PagamentosDoDia] = []
  
  var pagamentosAVencerQtd: Int?
  var pagamentosAVencerTotalAPagar: Double?
  
  var pagamentosVencidosQtd: Int?
  var pagamentosVencidosTotalAPagar: Double?
  
  var pagamentosExcluidosQtd: Int?
  var pagamentosExcluidosTotalAPagar: Double?
  
}
